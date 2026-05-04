# Frappe-16-Installation-on-Ubuntu-24.04-Complete-Setup-Guide-uv-PostgreSQL-
Complete step-by-step guide to install Frappe Framework v16 on Ubuntu 24.04 using modern tools like uv (Python 3.14), Node.js 22+, MariaDB, and PostgreSQL (experimental). Includes full setup, troubleshooting, and production-ready configuration.

````md
# 🚀 Complete Frappe 16 Installation Guide on Ubuntu 24.04

A **step-by-step production-ready guide** to install **Frappe Framework v16** on Ubuntu 24.04 using modern tools like **uv (Python manager), Node.js, MariaDB, and optional PostgreSQL (experimental)**.

This guide is written for developers who want a **clean, error-free setup** for Frappe 16.

---

## ⭐ Features

- ✔ Frappe Framework v16 setup
- ✔ Ubuntu 24.04 compatible
- ✔ Python 3.14 via uv (modern approach)
- ✔ Node.js 22+ support
- ✔ MariaDB (stable) + PostgreSQL (experimental)
- ✔ Bench CLI setup
- ✔ Production-ready structure

---

# 📌 Table of Contents

- System Update
- Install Dependencies
- Install Node.js
- Install uv (Python Manager)
- Install Python 3.14
- Install Bench CLI
- Initialize Frappe Bench 16
- Create New Site
- Switch Site (bench use)
- Start Server
- Common Issues Fix

---

# ⚙️ 1. System Update

```bash
sudo apt update && sudo apt upgrade -y
````

---

# 📦 2. Install Required Dependencies

```bash
sudo apt install -y git curl python3-dev python3-pip python3-venv \
redis-server mariadb-server mariadb-client \
pkg-config libffi-dev libssl-dev build-essential \
xvfb libfontconfig wkhtmltopdf
```

---

# 🟢 3. Install Node.js (Required for Frappe)

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
npm install -g yarn
```

---

# 🐍 4. Install uv (Python Manager)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.bashrc
```

Check version:

```bash
uv --version
```

---

# 🐍 5. Install Python 3.14 using uv

```bash
uv python install 3.14
uv python list
```

---

# 📦 6. Install Bench CLI

```bash
pip install frappe-bench
```

---

# 🚀 7. Initialize Frappe Bench v16

```bash
UV_PYTHON=3.14 bench init frappe-bench-16 --frappe-branch version-16
cd frappe-bench-16
```

---

# 🏗️ 8. Create New Site

## 👉 MariaDB (Recommended - Stable)

```bash
bench new-site platform.local
```

## 👉 PostgreSQL (Experimental)

```bash
bench new-site platform.local --db-type postgres
```

---

# 🔐 Important Prompts

When creating site:

```text
Enter mysql super user [root]:
```

👉 Press ENTER (default root)

Then:

```text
MySQL root password:
```

👉 Enter your MariaDB root password

Then:

```text
Set Administrator password:
```

👉 Set admin login password

---

# 🔄 9. Switch Active Site

```bash
bench use platform.local
```

✔ Sets default site for all commands

---

# ▶️ 10. Start Frappe Server

```bash
bench start
```

Open in browser:

```text
http://localhost:8000
```

---

# 🔑 Default Login

* Username: `Administrator`
* Password: (set during site creation)

---

# ⚠️ Common Issues Fix

## ❌ MySQL Access Denied

```bash
sudo mysql_secure_installation
```

Reset root:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;
```

---

## ❌ Redis not running

```bash
sudo systemctl start redis-server
```

---

## ❌ Node issues

```bash
node -v
```

Must be ≥ 22

---

## ❌ Site creation failed

Use:

```bash
bench drop-site platform.local --force
```

Then retry.

---

# 🧠 PostgreSQL Note

* PostgreSQL support is **experimental**
* Some ERPNext features may break
* MariaDB is still recommended for production

---

# 🧰 Tech Stack

* Frappe Framework v16
* Python 3.14 (via uv)
* Node.js 22+
* MariaDB / PostgreSQL (experimental)
* Redis
* Ubuntu 24.04

---

# 🚀 Workflow Summary

```bash
bench init frappe-bench-16
bench new-site platform.local
bench use platform.local
bench start
```

---

# 👨‍💻 Author

Muhammad Faheem Iqbal
Frontend Developer | React | Next.js | Frappe Enthusiast

---

# ⭐ Support

If this guide helped you:

* ⭐ Star the repo
* 🔁 Share with developers
* 🧠 Contribute improvements

```
