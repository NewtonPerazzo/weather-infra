#!/bin/sh
set -eu

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<SQL
CREATE DATABASE IF NOT EXISTS weather_analysis_db;
CREATE DATABASE IF NOT EXISTS authentication_db;

CREATE USER IF NOT EXISTS 'weather_user'@'%' IDENTIFIED BY '${WEATHER_DB_PASSWORD}';
CREATE USER IF NOT EXISTS 'auth_user'@'%' IDENTIFIED BY '${AUTH_DB_PASSWORD}';

GRANT ALL PRIVILEGES ON weather_analysis_db.* TO 'weather_user'@'%';
GRANT ALL PRIVILEGES ON authentication_db.* TO 'auth_user'@'%';
SQL