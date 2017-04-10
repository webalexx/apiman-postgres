FROM postgres:9.4

# Add database creation 
ADD files/apiman_postgresql.sql /docker-entrypoint-initdb.d/
ADD files/apiman-gateway_postgresql.sql /docker-entrypoint-initdb.d/
# ADD files/apiman-db-create.sh /docker-entrypoint-initdb.d/
 