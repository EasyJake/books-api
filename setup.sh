#!/bin/bash

# Navigate to the desired directory
read -p "Enter the directory where you want to create the project: " projectDirectory
cd "$projectDirectory" || exit

# Create project folder
echo "Creating books-api project folder..."
mkdir -p books-api
cd books-api || exit

# Create necessary directories
mkdir -p models controllers

# Check if Visual Studio Code is installed and PATH is set
if ! command -v code >/dev/null; then
  echo "Visual Studio Code command line tool not found. Please install it from within VS Code."
else
  echo "Opening project in Visual Studio Code..."
  code .
fi

# More of your setup script here...

# Update the entry point file to use the books controller
echo "Updating entry point file to use Books controller..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Use macOS sed syntax
  sed -i '' '/const mongoose = require/a\
  const booksController = require(\'./controllers/books\');\n\napp.use(\'/books\', booksController);' index.js
else
  # Assume GNU sed syntax
  sed -i '/const mongoose = require/a const booksController = require(\'./controllers/books\');\n\napp.use(\'/books\', booksController);' index.js
fi

echo "Setup of Book model, controller, and routes complete."
