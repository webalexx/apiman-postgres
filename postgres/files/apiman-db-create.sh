#!/bin/sh
echo "******CREATING APIMAN DATABASE******"
#su -c "psql -d apiman -f /docker-entrypoint-initdb.d/apiman_postgresql.sql"  -s /bin/sh postgres
gosu  postgres postgres --single -j apiman < /docker-entrypoint-initdb.d/apiman_postgresql.sql
echo ""
echo "******APIMAN DATABASE CREATED******"
