FROM my_postgres

# Install PostGIS
RUN apt-get install -y postgresql-9.4-postgis-2.1

# Add the initialization script
COPY init-postgis.sh /docker-entrypoint-initdb.d/
