#!/usr/bin/env bash
# wp-cli basic install script with sqlite database.
# based on https://gist.github.com/erm3nda/8444f8536b309ae198cb

# Download wp-package, by default does download en_US package (--locale="en_US")
wp core download

# You can later install another language package
# php wp-cli.phar core language es_ES --activate

# This part of the config is a bit dummy, because it will be overrided by sqlite plugin
wp core config --skip-check --dbname=wp --dbuser=wp --dbpass=pass

# Go to wp-content directory, then override db.php controller
cd wp-content

# Download sqlite integration plugin
curl -O https://raw.githubusercontent.com/aaemnnosttv/wp-sqlite-db/master/src/db.php

# Return to main directory.
cd ../

# Install downloaded wordpress, set real data and set desired url:port
wp core install --title=Dev --admin_name=admin --admin_email="admin@example.com" --admin_password=pass --url="http://localhost:8080/"

# Run the server. Would run using PHP -S builtin server
# Remember to edit the right php.ini located at same dir than php.exe and not the one with apache's files
wp server
