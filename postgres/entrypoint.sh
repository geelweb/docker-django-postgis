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

        # Defines default user/password and db
        : ${PG_USER:=docker}
        : ${PG_PASSWORD:=docker}
        : ${PG_DB:=$PG_USER}

        # Create the user
        #gosu postgres psql -U postgres -c "CREATE USER '$PG_USER' WITH SUPERUSER PASSWORD '$PG_PASSWORD'"
        gosu postgres postgres --single -jE << EOSQL
CREATE USER "$PG_USER" WITH SUPERUSER PASSWORD '$PG_PASSWORD';
EOSQL

        # Create the database
        #gosu postgres createdb -U $PG_USER $PG_DB
        gosu postgres postgres --single -jE << EOSQL
CREATE DATABASE "$PG_DB";
EOSQL

        # accept all connections with password
        echo "host all all 0.0.0.0/0 md5"  >> "$PGDATA"/pg_hba.conf
    fi

    exec gosu postgres "$@"
fi

exec "$@"
