# LAMP Stack Setup Script

## Overview
Automate the setup of a LAMP (Linux, Apache, MySQL, PHP) stack on Ubuntu systems with this script. It simplifies Apache and MySQL configurations, including virtual hosts and database creation for new sites.

## Features
- **Apache Installation**: Configures the Apache2 web server.
- **PHP Installation**: Installs PHP and modules like `libapache2-mod-php` and `php-mysql`.
- **MySQL Server**: Sets up MySQL, a robust database system.
- **Virtual Host Configuration**: Dynamically creates Apache virtual host configurations.
- **Database Creation**: Generates a MySQL database for each virtual host.
- **Directory Setup**: Establishes a directory structure under `/var/www/html/`.
- **ServerName Configuration**: Helps avoid common server identification errors.
- **Default Site Handling**: Disables the default Apache site to prevent conflicts.
- **Permissions and Ownership**: Ensures correct permissions for web directories.

## Prerequisites
- Ubuntu Server (Tested on versions 18.04 and 20.04)
- `sudo` privileges

## Usage
1. **Download the Script**: Clone this repo or download the script to your server.
2. **Make Executable**:
   ```bash
   chmod +x install.sh
sudo ./install.sh
