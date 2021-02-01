#!/bin/bash

secrets_files=("/conjur/db_url", "/conjur/db_username", "/conjur/db_password")

# Confirms whether all expected secrets files exist
function all_files_exist() {
  for secrets_file in $secrets_files; do
    if [[ ! -e "$secrets_file" ]]; then
      false
    fi
  done
  true
}

# Wait for all expected secrets files to be created
while true; do
  echo "Checking for existence of secrets files"
  if all_files_exist; then
    break
  fi
  sleep 10
done

# Copy the secrets files content to environment variables and export
DB_URL="$(cat /conjur/db_url)"
export DB_URL
DB_USERNAME="$(cat /conjur/db_username)"
export DB_USERNAME
DB_PASSWORD="$(cat /conjur/db_password)"
export DB_PASSWORD

# Start the app
java -jar /app.jar
