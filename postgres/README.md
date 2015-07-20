# Postgres

A Postgres image.

This image is only to play with Docker, use the official
[Postgres repo](https://registry.hub.docker.com/_/postgres/) if you're looking
for a Postgres image.

## Build the container

    $ docker build --rm -t my_postgres postgres/

## Run the container

    $ docker run --name postgres_server -d my_postgres

## Connect to the container with `psql`

Gets the container IP:

    $ docker inspect postgres_server | grep IPAddress
            "IPAddress": "172.17.0.8",
            "SecondaryIPAddresses": null,

Connect to the PostgreSQL server:

    $ docker run -it --link postgres_server --rm my_postgres sh -c 'exec psql -h 172.17.0.23 -p 5432 -U postgres'
    psql (9.4.4)
    Type "help" for help.

    postgres=#  Create database plop;
    CREATE DATABASE
    postgres=# \c plop
    You are now connected to database "plop" as user "postgres".
    plop=#

To make this step simpler, Docker defines several environment variables when
you link containers (see https://docs.docker.com/userguide/dockerlinks/#environment-variables)

So you can simply define an alias to the linked container with
`--link postgres-server:server1` and get the IP and port with
`$SERVER1_PORT_5432_TCP_ADDR` and `$SERVER1_PORT_5432_TCP_PORT`


    $ docker run -it --link postgres_server:server1 --rm my_postgres sh -c 'exec psql -h "$SERVER1_PORT_5432_TCP_ADDR"  -p "$SERVER1_PORT_5432_TCP_PORT" -U postgres'
