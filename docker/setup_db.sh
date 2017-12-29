echo 'start --- creating databases'
env
PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -U $POSTGRES_USER  < db.sql

echo '----- end creating databases'