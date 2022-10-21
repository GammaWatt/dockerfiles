#!/bin/bash

if [ -z ${SITENAME} ]
then 
    echo "Please provide SITENAME"
    exit 1
fi

if [ -z ${DB_ROOT_PASSWORD} ]
then 
    echo "Please provide DB_ROOT_PASSWORD"
    exit 1
fi

if [ -z ${DB_HOST} ]
then 
    echo "Please provide DB_HOST"
    exit 1
fi

if [ -z ${DB_NAME} ]
then 
    echo "Please provide DB_NAME"
    exit 1
fi

if [ -z ${DB_PORT} ]
then 
    echo "Please provide DB_PORT"
    exit 1
fi

if [ -z ${DB_TYPE} ]
then 
    echo "Please provide DB_TYPE"
    exit 1
fi

if [ -z ${DB_PASSWORD} ]
then 
    echo "Please provide DB_PASSWORD"
    exit 1
fi

if [ -z ${ADMIN_PASSWORD} ]
then 
    echo "Please provide ADMIN_PASSWORD"
    exit 1
fi


if [ ! -d "/home/frappe/frappe-bench/sites/${SITENAME}" ]
then
    bench new-site ${SITENAME} \
        --db-root-password=${DB_ROOT_PASSWORD} \
        --db-host=${DB_HOST} \
        --db-name=${DB_NAME} \
        --db-port=${DB_PORT} \
        --no-mariadb-socket \
        --db-type=${DB_TYPE} \
        --db-password=${DB_PASSWORD} \
        --admin-password=${ADMIN_PASSWORD} \
        --verbose \
        --force
    bench --site ${SITENAME} install-app erpnext
    bench use ${SITENAME}
    bench set-mariadb-host ${DB_HOST}
fi

$@