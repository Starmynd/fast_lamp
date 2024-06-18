#!/bin/bash

# Ask for the ServerName (domain or IP)
echo "Please enter the ServerName for the Apache configuration (e.g., example.com or IP address):"
read server_name

# Ask for the site name to create a directory under /var/www/html
echo "Please enter the name of the site directory you want to create under /var/www/html:"
read site_name

# Ask for MySQL root password to use for operations
echo "Please enter the MySQL root password:"
read -s mysql_root_password

# Update and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Install necessary packages
sudo apt-get install -y software-properties-common apache2 php libapache2-mod-php php-mysql mysql-server

# Check if the virtual host file already exists
if [ ! -f /etc/apache2/sites-available/$site_name.conf ]; then
    # Create a virtual host file for the new site
    sudo bash -c "cat > /etc/apache2/sites-available/$site_name.conf <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@$server_name
    ServerName $server_name
    ServerAlias www.$server_name
    DocumentRoot /var/www/html/$site_name
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF"
    # Enable the new site
    sudo a2ensite $site_name.conf
else
    echo "Site configuration already exists, skipping creation."
fi

# Disable the default site
sudo a2dissite 000-default.conf

# Reload Apache to apply changes
sudo systemctl reload apache2

# Create the directory for the site if it doesn't exist
if [ ! -d /var/www/html/$site_name ]; then
    sudo mkdir -p /var/www/html/$site_name
    # Set permissions for the site directory
    sudo chown -R www-data:www-data /var/www/html/$site_name
    sudo chmod -R 755 /var/www/html/$site_name
else
    echo "Directory /var/www/html/$site_name already exists, skipping creation."
fi

# Check if the MySQL database exists and create it if it doesn't
DB_CHECK=`mysql -u root -p$mysql_root_password -e "SHOW DATABASES LIKE '$site_name'" -s -N`
if [ -z "$DB_CHECK" ]; then
    mysql -u root -p$mysql_root_password -e "CREATE DATABASE $site_name"
    echo "Database $site_name created."
else
    echo "Database $site_name already exists, skipping creation."
fi

# Restart Apache to apply changes
sudo systemctl restart apache2

# Check if Apache installed correctly
sudo apache2ctl configtest

# Final feedback to user
echo "Setup complete. Apache is configured with ServerName $server_name, the site directory /var/www/html/$site_name has been created or already exists, and the database setup is complete."
