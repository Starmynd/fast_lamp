LAMP Stack Setup Script
Overview
This Bash script automates the setup of a LAMP (Linux, Apache, MySQL, PHP) stack on Ubuntu systems. It is designed to streamline the configuration of Apache and MySQL, including setting up virtual hosts and creating corresponding MySQL databases for new sites. This script is ideal for developers looking to quickly provision websites on a fresh server.

Features
Apache Installation: Installs and configures Apache2 web server.
PHP Installation: Installs PHP along with commonly used modules like libapache2-mod-php, php-mysql, and others required for web development.
MySQL Server Installation: Sets up MySQL server, a robust database management system.
Dynamic Virtual Host Configuration: Creates Apache virtual host configurations based on user input.
Database Creation: Automatically creates a MySQL database corresponding to each new virtual host.
Directory Setup: Establishes a web directory structure under /var/www/html/ based on user input.
ServerName Configuration: Configures Apache to recognize the server name provided by the user, avoiding common errors related to server identification.
Default Site Handling: Disables the default Apache site to prevent conflicts with new site configurations.
Permissions and Ownership: Sets appropriate permissions and ownership for the web directories to ensure that Apache can serve the files correctly.
Prerequisites
Ubuntu Server (The script is tested on Ubuntu 18.04 and 20.04)
sudo privileges on the server
Usage
Download the Script: Clone this repository or download the script directly to your Ubuntu server.
Make the Script Executable:
bash
Copy code
chmod +x install.sh
Run the Script:
bash
Copy code
sudo ./install.sh
Follow the on-screen prompts to enter the required information such as the server name, site name, and MySQL root password.
Important Notes
The script requires user interaction to input the server name, site directory name, and MySQL root password. Ensure this information is handy before starting.
Review the script prior to running it to make sure it fits your specific needs. Modifications may be necessary depending on your server configuration.
Contributing
Contributions to this script are welcome! If you have suggestions for improvement or have identified a bug, please open an issue or submit a pull request.

License
This script is released under the MIT License.

