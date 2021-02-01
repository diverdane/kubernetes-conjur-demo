#!/bin/bash

pause_time=2

while true; do
  echo "Retrieving and injecting secrets"
  summon --provider summon-conjur -f /etc/secrets.yml sh -c \
    "echo \$DB_URL > /conjur/db_url && \
     echo \$DB_USERNAME > /conjur/db_username && \
     echo \$DB_PASSWORD > /conjur/db_password"
  echo "Pausing $pause_time seconds..."
  sleep $pause_time
done
