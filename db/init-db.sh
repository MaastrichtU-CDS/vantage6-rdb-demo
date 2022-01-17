#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "MaastroDB";
    CREATE DATABASE "MumcDB";
EOSQL

if [[ $OMOP_CDM = True ]]
then
    psql -v ON_ERROR_STOP=1 --username postgres --dbname "MaastroDB" < '/mnt/data/omop.psql'
    psql -v ON_ERROR_STOP=1 --username postgres --dbname "MumcDB" < '/mnt/data/omop.psql'
else
	psql -v ON_ERROR_STOP=1 --username postgres --dbname "MaastroDB" <<-EOSQL
        DROP TABLE IF EXISTS "records";
        CREATE TABLE "public"."records" (
            "ID" integer NOT NULL,
            "Age" integer NOT NULL,
            "Clinical.T.Stage" integer NOT NULL,
            "Clinical.N.Stage" integer NOT NULL,
            "Clinical.M.Stage" integer NOT NULL,
            "Overall.Ajcc.Stage" text NOT NULL,
            "Histology" text NOT NULL,
            "Sex" text NOT NULL,
            "Survival.Time.Days" integer NOT NULL,
            "deadstatus.event" integer NOT NULL,
            CONSTRAINT "Records_ID" PRIMARY KEY ("ID")
        ) WITH (oids = false);
        COPY Records FROM '/mnt/data/maastro.csv' WITH DELIMITER ',' CSV HEADER;
	EOSQL

	psql -v ON_ERROR_STOP=1 --username postgres --dbname "MumcDB" <<-EOSQL
        DROP TABLE IF EXISTS "records";
        CREATE TABLE "public"."records" (
            "ID" integer NOT NULL,
            "Age" integer NOT NULL,
            "Clinical.T.Stage" integer NOT NULL,
            "Clinical.N.Stage" integer NOT NULL,
            "Clinical.M.Stage" integer NOT NULL,
            "Overall.Ajcc.Stage" text NOT NULL,
            "Histology" text NOT NULL,
            "Sex" text NOT NULL,
            "Survival.Time.Days" integer NOT NULL,
            "deadstatus.event" integer NOT NULL,
            CONSTRAINT "Records_ID" PRIMARY KEY ("ID")
        ) WITH (oids = false);
        COPY records FROM '/mnt/data/mumc.csv' WITH DELIMITER ',' CSV HEADER;
	EOSQL
fi
