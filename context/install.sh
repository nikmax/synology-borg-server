#!/bin/bash

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
else
    echo ".env nicht gefunden"
    exit 1
fi

mkdir -p "$SSH_CONFIG_DIR"
mkdir -p "$BORG_REPOS_DIR"
touch "$AUTHORIZED_KEYS_FILE"

chown -R "$BORG_UID:$BORG_GID" "$BORG_REPOS_DIR"
chown "$BORG_UID:$BORG_GID" "$AUTHORIZED_KEYS_FILE"

chmod 750 "$BORG_REPOS_DIR"
chmod 600 "$AUTHORIZED_KEYS_FILE"
