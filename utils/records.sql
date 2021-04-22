DROP TABLE IF EXISTS "Records";
CREATE TABLE "public"."Records" (
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
