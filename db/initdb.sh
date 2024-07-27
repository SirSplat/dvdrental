#!/bin/bash
set -e

psql -v ON_ERROR_STP=1 --username "dbo" --dbname "postgres" <<-ESQL
    CREATE DATABASE dvdrental TEMPLATE template1;
    COMMENT ON DATABASE dvdrental IS 'Home of dvdrental database. this attempts to use all manner of DDL, DML.';
    ALTER DATABASE dvdrental SET search_path TO rental,exts,sqitch,pgtap;
ESQL
