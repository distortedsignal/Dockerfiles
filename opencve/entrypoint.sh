#! /bin/sh

function make_run_as_cmd() {
    echo "su -l -" $1 "-c "
}

RUN_AS_PG=$(make_run_as_cmd "postgres")
RUN_AS_REDIS=$(make_run_as_cmd "redis")
RUN_AS_OPENCVE=$(make_run_as_cmd "opencve")

OPENCVE_CFG_LOCATION="/var/lib/postgresql/opencve/opencve.cfg"

$RUN_AS_PG "pg_ctl init -D /home/postgres"
$RUN_AS_PG "pg_ctl start -D /home/postgres"
$RUN_AS_PG "psql -c \"CREATE DATABASE opencve\" template1"

$RUN_AS_PG "opencve init"
$RUN_AS_PG "sed -e 's/^database_uri.*$/database_uri = postgresql:\/\/localhost:5432\/opencve/g' $OPENCVE_CFG_LOCATION | sed -e 's/^server_name.*$/server_name = 0.0.0.0:8000/g' >> $OPENCVE_CFG_LOCATION.final"
$RUN_AS_PG "mv $OPENCVE_CFG_LOCATION.final $OPENCVE_CFG_LOCATION"
$RUN_AS_PG "opencve upgrade-db"
$RUN_AS_PG "redis-server &"
sleep 5
$RUN_AS_PG "opencve celery worker -l INFO &"
$RUN_AS_PG "opencve celery beat -l INFO &"

$RUN_AS_PG "opencve create-user --admin --password admin admin admin@example.com"

sleep 10

echo
echo
echo "Opencve cfg:"
cat $OPENCVE_CFG_LOCATION
echo
echo

echo "Opencve version from opencve --version:"
opencve --version
echo
echo
echo "Python version:"
python --version
echo
echo "Python3 version:"
python3 --version

$RUN_AS_PG "opencve import-data --confirm"

echo "Running webserver"
$RUN_AS_PG "opencve webserver &"

sh


