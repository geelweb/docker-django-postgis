# Geodjango

This app is based on the [geodjango tutorial](https://docs.djangoproject.com/en/1.8/ref/contrib/gis/tutorial/).
To set-up and run it, you have to install [Compose](https://docs.docker.com/compose/install/)

## Dependances

The app use the postgis image build in the step3. Before to run the app, ensure
you built the postgres and postgis images:

    $ docker build --rm -t my_postgres postgres/
    $ docker build --rm -t my_postgis postgis/

## Set-up the project

*Migrate the database*

    $ docker-compose run web python manage.py migrate

*Load the data*

    $ docker-compose run web python manage.py shell
    >>> from world import load
    >>> load.run()

*Create a super user*

    $ docker-compose run web python manage.py createsuperuser

## Run the project

*Get the container IP*

For Linux users, you can simply use `localhost`.

If you use [boot2docker](https://github.com/boot2docker/boot2docker) to run
docker on a Mac, you can get the IP of the VM typing:

    $ boot2docker ip
    192.168.59.103


*Run the app*

Now you can run the app with:

    $ docker-compose up

and browse http://localhost:8000/admin
