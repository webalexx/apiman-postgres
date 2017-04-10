FROM postgres:9.4

# Add database creation 
COPY files/apiman-init.sql /docker-entrypoint-initdb.d/
COPY files/apiman-gateway-init.sql /docker-entrypoint-initdb.d/