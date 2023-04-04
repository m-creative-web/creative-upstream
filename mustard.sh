#!/bin/bash

# Pull dat code.
git pull

# Composer install
lando composer install

# Clear caches to not upset config_split
lando drush cr

# Update the db
lando drush updb -y

# Sync config
lando drush cim -y

# Clear cache again
lando drush cr

# Enable dev modules
lando drush en field_ui update views_ui -y

