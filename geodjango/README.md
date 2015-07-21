# Geodjango

    $ docker-compose up

    $ docker-compose run web python manage.py migrate

    $ docker-compose run web python manage.py shell
    >>> from world import load
    >>> load.run()

    $ docker-compose run web python manage.py createsuperuser

    $ boot2docker ip
    192.168.59.103

    $ docker-compose up

browse http://192.168.59.103:8000/admin
