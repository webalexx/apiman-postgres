#!/bin/bash

# Run containeres
docker-compose up -d db
sleep 10s
docker-compose up -d elastic
docker-compose up -d apiman


#docker run -it --rm -p 8080:8080 -p 9990:9990 -p 8787:8787 webalexx/apiman
