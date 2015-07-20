#!/bin/bash
set -e

if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"

    # Initializes the database if the postgresql data dir does not exists
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb

        # listen on all addresses adding `listen_addresses = *` in
        # postgresql.conf
        sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

        # accept all connections without password
        echo "host all all 0.0.0.0/0 trust"  >> "$PGDATA"/pg_hba.conf
    fi

    exec gosu postgres "$@"
fi

exec "$@"
