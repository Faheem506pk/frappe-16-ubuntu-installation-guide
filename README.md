# Frappe 16 Installation Guide for Ubuntu 24.04

![Ubuntu 24.04](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=flat-square&logo=ubuntu&logoColor=white)
![Frappe 16](https://img.shields.io/badge/Frappe-v16-0089FF?style=flat-square)
![Python 3.14](https://img.shields.io/badge/Python-3.14-3776AB?style=flat-square&logo=python&logoColor=white)
![Node.js 22](https://img.shields.io/badge/Node.js-22+-339933?style=flat-square&logo=nodedotjs&logoColor=white)
![MariaDB](https://img.shields.io/badge/Database-MariaDB-003545?style=flat-square&logo=mariadb&logoColor=white)

A complete developer-friendly guide to install **Frappe Framework v16** on **Ubuntu 24.04** using **uv**, **Python 3.14**, **Node.js 22+**, **MariaDB**, Redis, Yarn, wkhtmltopdf, and optional PostgreSQL support.

This guide is useful for developers building ERP systems, SaaS platforms, internal admin tools, business dashboards, and full-stack applications with Frappe Framework or ERPNext.

## Features

- Frappe Framework v16 setup on Ubuntu 24.04
- Python 3.14 installation using uv
- Node.js 22+ and Yarn setup
- MariaDB setup for stable Frappe development
- PostgreSQL setup option for experimental usage
- Bench CLI installation and project initialization
- New site creation, active site switching, and local server startup
- Common troubleshooting fixes for Redis, MariaDB, Node.js, and site creation

## Quick Start

```bash
UV_PYTHON=3.14 bench init frappe-bench-16 --frappe-branch version-16
cd frappe-bench-16
bench new-site platform.local
bench use platform.local
bench start
```

Open your Frappe site:

```text
http://localhost:8000
```

## Table of Contents

- [Requirements](#requirements)
- [System Update](#system-update)
- [Install Required Dependencies](#install-required-dependencies)
- [Install Node.js 22](#install-nodejs-22)
- [Install uv](#install-uv)
- [Install Python 3.14](#install-python-314)
- [Install Bench CLI](#install-bench-cli)
- [Initialize Frappe Bench 16](#initialize-frappe-bench-16)
- [Create a New Site](#create-a-new-site)
- [Switch Active Site](#switch-active-site)
- [Start Frappe Server](#start-frappe-server)
- [Default Login](#default-login)
- [Common Issues](#common-issues)
- [PostgreSQL Note](#postgresql-note)
- [Tech Stack](#tech-stack)
- [SEO Keywords](#seo-keywords)
- [Recommended GitHub Topics](#recommended-github-topics)

## Requirements

- Ubuntu 24.04 LTS
- sudo user access
- Stable internet connection
- Basic Linux terminal knowledge

## System Update

```bash
sudo apt update && sudo apt upgrade -y
```

## Install Required Dependencies

```bash
sudo apt install -y git curl python3-dev python3-pip python3-venv \
redis-server mariadb-server mariadb-client \
pkg-config libffi-dev libssl-dev build-essential \
xvfb libfontconfig wkhtmltopdf
```

## Install Node.js 22

Frappe requires Node.js for frontend asset building.

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g yarn
```

Check versions:

```bash
node -v
npm -v
yarn -v
```

## Install uv

uv is a modern Python package and version manager.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.bashrc
```

Check uv:

```bash
uv --version
```

## Install Python 3.14

```bash
uv python install 3.14
uv python list
```

## Install Bench CLI

```bash
pip install frappe-bench
```

Check Bench:

```bash
bench --version
```

## Initialize Frappe Bench 16

```bash
UV_PYTHON=3.14 bench init frappe-bench-16 --frappe-branch version-16
cd frappe-bench-16
```

## Create a New Site

### MariaDB Recommended

MariaDB is the recommended database for stable Frappe development and production use.

```bash
bench new-site platform.local
```

During site creation, Bench may ask:

```text
Enter mysql super user [root]:
```

Press Enter to use the default root user.

Then enter your MariaDB root password:

```text
MySQL root password:
```

Finally, set your Frappe Administrator password:

```text
Set Administrator password:
```

### PostgreSQL Experimental

PostgreSQL support exists in Frappe v16, but it is still evolving. Use MariaDB for production unless your project specifically requires PostgreSQL testing.

```bash
bench new-site platform.local --db-type postgres
```

## Switch Active Site

```bash
bench use platform.local
```

This sets `platform.local` as the default site for Bench commands.

## Start Frappe Server

```bash
bench start
```

Open the app in your browser:

```text
http://localhost:8000
```

## Default Login

- Username: `Administrator`
- Password: the Administrator password you set during site creation

## Common Issues

### MySQL Access Denied

Run MariaDB secure installation:

```bash
sudo mysql_secure_installation
```

If needed, reset the root authentication method:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
```

### Redis Not Running

```bash
sudo systemctl start redis-server
sudo systemctl enable redis-server
```

### Node.js Version Issues

```bash
node -v
```

Node.js should be version 22 or higher.

### Site Creation Failed

If a failed site exists, remove it and retry:

```bash
bench drop-site platform.local --force
bench new-site platform.local
```

## PostgreSQL Note

- PostgreSQL support in Frappe v16 is experimental.
- Some Frappe or ERPNext features may not behave the same as MariaDB.
- MariaDB remains the safer database choice for production deployments.

## Tech Stack

- Frappe Framework v16
- Ubuntu 24.04 LTS
- Python 3.14 via uv
- Node.js 22+
- Yarn
- MariaDB
- PostgreSQL experimental
- Redis
- Bench CLI
- wkhtmltopdf

## SEO Keywords

Frappe 16 installation Ubuntu 24.04, ERPNext v16 setup guide, Frappe Framework install, Python 3.14 uv setup, Node.js 22 Frappe, MariaDB Frappe setup, PostgreSQL Frappe experimental, Bench CLI tutorial, full-stack ERP system, Linux server Frappe install, Ubuntu Frappe development environment, Frappe production setup.

## Recommended GitHub Topics

Add these topics in the GitHub repository settings:

```text
frappe
frappe-16
frappe-framework
erpnext
ubuntu-24
ubuntu-installation
python-3-14
uv-python
nodejs-22
mariadb
postgresql
bench-cli
backend
fullstack
devops
linux-server
```

## Author

Muhammad Faheem Iqbal  
GitHub: [@faheem506pk](https://github.com/faheem506pk)  
Frontend Developer | React | Next.js | Frappe Enthusiast

## Support

If this guide helped you:

- Star the repository
- Share it with Frappe and ERPNext developers
- Contribute improvements through issues or pull requests
