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

### Create a basic Postgres image

Checkout the `step1` branch

    $ git checkout step1

The Postgres image is located in the `postgres` repository. Read the [Postgres README](postgres/README.md)
for detailled instructions on how to build and run the container.

### Update the Postgres image

Checkout the `step2` branch

    $ git checkout step2

This step update the Postgres image allowing the definition of the database
name. You can also create a user and a password. See the [Postgres README](postgres/README.md)
for details on how to build and run the container, and to see how to defines the environment variables.

### Create a PostGIS image

Checkout the `step3` branch

    $ git checkout step3

In this step, we update the Postgres image to allow the execution of scripts
added by child containers, and we create a PostGIS image based on our Postgres
image.

The detailled instruction about the PostGIS image are in the [PostGIS
README](postgis/README.md).

### The Django App

I use the [geodjango
tutorial](https://docs.djangoproject.com/en/1.8/ref/contrib/gis/tutorial/).

I use [Compose](https://docs.docker.com/compose/django/) to set-up and run the app.

In addition to the steps of the geodjango tutorial, I created the 3 following
files:

 - [Dockerfile](geodjango/Dockerfile)
 - [requirements.txt](geodjango/requirements.txt)
 - [docker-compose.yml](geodjango/docker-compose.yml)

Detailed instructions to set-up and run the geodjango app are in the [geodjango
README](geodjango/README.md)
