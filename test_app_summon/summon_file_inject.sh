#!/bin/bash

while true; do
  echo "Retrieving secrets"
  summon --provider summon-conjur -f /etc/secrets.yml sh -c \
    "echo \$DB_URL > /conjur/db_url && \
     echo \$DB_USERNAME > /conjur/db_username && \
     echo \$DB_PASSWORD > /conjur/db_password"
  echo "Pausing 10 seconds..."
  sleep 10
done
