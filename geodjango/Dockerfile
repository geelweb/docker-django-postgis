FROM python:2.7

ENV PYTHONUNBUFFERED 1

RUN apt-get update -y
RUN apt-get -y install binutils libproj-dev gdal-bin

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/

RUN pip install -r requirements.txt

ADD . /code/
