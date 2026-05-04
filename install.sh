#!/usr/bin/env bash

set -euo pipefail

PYTHON_VERSION="${PYTHON_VERSION:-3.14}"
NODE_MAJOR="${NODE_MAJOR:-22}"

info() {
  printf "\n[frappe-setup] %s\n" "$1"
}

require_ubuntu() {
  if [ ! -f /etc/os-release ]; then
    echo "This installer is designed for Ubuntu 24.04." >&2
    exit 1
  fi

  . /etc/os-release

  if [ "${ID:-}" != "ubuntu" ]; then
    echo "This installer is designed for Ubuntu. Detected: ${ID:-unknown}" >&2
    exit 1
  fi
}

warn_if_root() {
  if [ "$(id -u)" -eq 0 ]; then
    echo "Do not run Bench as root. Run this script as a normal sudo user." >&2
    exit 1
  fi
}

install_system_packages() {
  info "Updating Ubuntu packages"
  sudo apt update
  sudo apt upgrade -y

  info "Installing Frappe system dependencies"
  sudo apt install -y \
    git \
    curl \
    python3-dev \
    python3-pip \
    python3-venv \
    redis-server \
    mariadb-server \
    mariadb-client \
    pkg-config \
    libffi-dev \
    libssl-dev \
    build-essential \
    xvfb \
    libfontconfig \
    wkhtmltopdf
}

install_node() {
  info "Installing Node.js ${NODE_MAJOR}"
  curl -fsSL "https://deb.nodesource.com/setup_${NODE_MAJOR}.x" | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm install -g yarn
}

install_uv_python() {
  info "Installing uv"
  curl -LsSf https://astral.sh/uv/install.sh | sh

  export PATH="$HOME/.local/bin:$PATH"

  info "Installing Python ${PYTHON_VERSION} with uv"
  uv python install "${PYTHON_VERSION}"
}

install_bench() {
  info "Installing Bench CLI"
  python3 -m pip install --user frappe-bench
}

enable_services() {
  info "Enabling Redis and MariaDB"
  sudo systemctl enable redis-server
  sudo systemctl start redis-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
}

print_next_steps() {
  cat <<EOF

Setup complete.

Next steps:

  export PATH="\$HOME/.local/bin:\$PATH"
  UV_PYTHON=${PYTHON_VERSION} bench init frappe-bench-16 --frappe-branch version-16
  cd frappe-bench-16
  bench new-site platform.local
  bench use platform.local
  bench start

Open:

  http://localhost:8000

EOF
}

main() {
  require_ubuntu
  warn_if_root
  install_system_packages
  install_node
  install_uv_python
  install_bench
  enable_services
  print_next_steps
}

main "$@"
