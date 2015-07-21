# PostGIS

PostGIS Docker image

## Build the Postgres image

    $ docker build --rm -t my_postgres postgres/

## Build the PostGIS image

    $ docker build --rm -t my_postgis postgis/

## Run the PostGIS image

    $ docker run --name postgres_server -d my_postgis

As in the postgres image, you can use environment variables to define postgres
db name, user and password. See [postgres README](../postgres/README.md)

## Connect with psql

    $ docker run -it --link postgres_server:server1 --rm my_postgres sh -c 'exec psql -h "$SERVER1_PORT_5432_TCP_ADDR"  -p "$SERVER1_PORT_5432_TCP_PORT" -U docker docker'
