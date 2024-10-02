#!/bin/bash

# Step 1: Create a new Laravel project with Sail
echo "Creating new Laravel project: my-sail-project"
curl -s https://laravel.build/my-sail-project | bash

# Step 2: Navigate to the project directory
cd my-sail-project

# Step 3: Install Laravel Sail as a development dependency
echo "Installing Laravel Sail as a development dependency"
composer require laravel/sail --dev

# Step 4: Publish Sail configuration
echo "Publishing Sail configuration"
php artisan sail:install

# Step 5: Configure MySQL in the Sail configuration
echo "Configuring MySQL in the docker-compose.yml file"
sed -i 's/# \- mysql/\- mysql/' docker-compose.yml

# Step 6: Run Sail to start the containers
echo "Starting Sail containers"
./vendor/bin/sail up -d

# Step 7: Initialize Git repository
echo "Initializing Git repository"
git init

# Step 8: Configure .gitignore file to exclude unnecessary files
echo "Configuring .gitignore"
cat <<EOT > .gitignore
/vendor
/node_modules
/storage/*.key
.env
docker-compose.override.yml
EOT

# Step 9: Create a GitHub repository (manual step, not automated in this script)
echo "Create a GitHub repository manually using the GitHub website or GitHub CLI."
echo "Once created, add the repository as a remote and push the local code."

# Command to add remote and push (run after creating a repo on GitHub):
# git remote add origin https://github.com/your-username/my-sail-project.git
# git branch -M main
# git push -u origin main

# Step 10: Peer setup instructions (manual step for documentation)
echo "Instructions for peer developers to set up the project will be provided manually."
