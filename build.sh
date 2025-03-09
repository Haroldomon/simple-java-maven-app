#!/bin/bash

# Function to check if Java is installed
check_java() {
  if command -v java &> /dev/null
  then
      echo "Java is installed."
  else
      echo "Java is not installed. Please install Java."
      exit 1
  fi
}

# Function to check if Node.js is installed
check_node() {
  if command -v node &> /dev/null
  then
      echo "Node.js is installed."
  else
      echo "Node.js is not installed. Please install Node.js."
      exit 1
  fi
}

# Function to build the Java project using Maven
build_java() {
  echo "Building Java project with Maven..."
  mvn clean install > build_logs_java.txt 2>&1
  if [ $? -eq 0 ]; then
    echo "Java build successful."
  else
    echo "Java build failed. Check build_logs_java.txt for details."
    exit 1
  fi
}


# Main script execution
echo "Starting build process..."

# Check if Java is installed
check_java


# Build the Java and Node.js projects
build_java

echo "Build process completed successfully."
