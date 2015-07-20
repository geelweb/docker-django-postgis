# Docker / Django / Postgis

The goal of this repository is to test Docker to work with Django and PostGIS.

## Requirements

The only things you need to do before continue is installing Docker.

I decided to not use an existing Docker images for Postgres or PostGIS because
the best way to learn and understand how Docker can help me, is to write code
and to search how to resolve problems.

But if you're lookin for a Postgres or PostGIS image, this repository is not for
you. You can use the official [Postgres repo](https://registry.hub.docker.com/_/postgres/)
or one of the already available [PostGIS repos](https://registry.hub.docker.com/search?q=postgis)

## How to use this repository

This repository is build like a tutorial, with several steps. Each step is a git
branch you can checkout (eg `git checkout step1`)

## The steps

 1. Create a basic Postgres image (branch step1)
 2. Enforce security to the Postgres container adding a user/password. Create a
 database (step2)
 3. Create a PostGIS image (step3)
 4. Create a Django App (step4)
 5. Use fig (step5)

### Create a basic Postgres image

The Postgres image is located in the `postgres` repository. Read the [Postgres README](postgres/README.md]
for detailled instructions on how to build and run the container.
