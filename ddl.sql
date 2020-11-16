CREATE TABLE "Platform"
(
 "platform_id"     numeric(4) NOT NULL,
 "platform_name"   varchar(50) NOT NULL,
 "CPV"             numeric(8,4) NOT NULL,
 "price_per_month" numeric(8,4) NOT NULL,
 "no_of_users"     numeric(11) NOT NULL,
 "no_of_profiles"  numeric(2) NOT NULL,
 CONSTRAINT "PK_platform" PRIMARY KEY ( "platform_id" )
);

CREATE TABLE "Financier"
(
 "fin_id"       numeric(4) NOT NULL,
 "fin_name"     varchar(30) NOT NULL,
 "interst_rate" numeric(3) NOT NULL,
 "email"        varchar(30) NOT NULL,
 CONSTRAINT "PK_financer" PRIMARY KEY ( "fin_id" )
);


CREATE TABLE "Budget"
(
 "budget_id"       numeric(4) NOT NULL,
 "crew_cost"       numeric(15,4) NOT NULL,
 "production_cost" numeric(15,4) NOT NULL,
 "director_cost"   numeric(15,4) NOT NULL,
 CONSTRAINT "PK_budget" PRIMARY KEY ( "budget_id" )
);

CREATE TABLE "Cast_members"
(
 "actor_id"   numeric(4) NOT NULL,
 "actor_name" varchar(30) NOT NULL,
 "gender"     varchar(2) NOT NULL,
 "age"        numeric(3) NOT NULL,
 "CPF"        numeric(12,2) NOT NULL,
 CONSTRAINT "PK_crew" PRIMARY KEY ( "actor_id" )
);

CREATE TABLE "Crew_members"
(
 "member_id"   numeric(4) NOT NULL,
 "member_name" varchar(30) NOT NULL,
 "proffesion"  varchar(30) NOT NULL,
 "email"       varchar(30) NOT NULL,
 "CPF"         numeric(12,2) NOT NULL,
 CONSTRAINT "PK_crew" PRIMARY KEY ( "member_id" )
);

CREATE TABLE "Director"
(
 "dir_id"         numeric(4) NOT NULL,
 "dir_name"       varchar(30) NOT NULL,
 "no_of_asst_dir" numeric(2) NOT NULL,
 "no_of_days"     numeric(3) NOT NULL,
 "CPF"            numeric(12,2) NOT NULL,
 "email"          varchar(30) NOT NULL,
 CONSTRAINT "PK_director" PRIMARY KEY ( "dir_id" )
);

CREATE TABLE "Movie"
(
 "movie_id"     numeric(4) NOT NULL,
 "movie_title"  varchar(30) NOT NULL,
 "genre"        varchar(30) NOT NULL,
 "release_date" date NOT NULL,
 "box_office"   numeric(15,2) NOT NULL,
 CONSTRAINT "PK_director" PRIMARY KEY ( "movie_id" )
);

CREATE TABLE "Producer"
(
 "pro_id"         numeric(4) NOT NULL,
 "pro_name"       varchar(30) NOT NULL,
 "email"          varchar(30) NOT NULL,
 "no_of_exec_pro"  NOT NULL,
 CONSTRAINT "PK_producer" PRIMARY KEY ( "pro_id" )
);

CREATE TABLE "approaches"
(
 "dir_id" numeric(4) NOT NULL,
 "pro_id" numeric(4) NOT NULL,
 CONSTRAINT "FK_76" FOREIGN KEY ( "dir_id" ) REFERENCES "Director" ( "dir_id" ),
 CONSTRAINT "FK_79" FOREIGN KEY ( "pro_id" ) REFERENCES "Producer" ( "pro_id" )
);

CREATE INDEX "fkIdx_76" ON "approaches"
(
 "dir_id"
);

CREATE INDEX "fkIdx_79" ON "approaches"
(
 "pro_id"
);


CREATE TABLE "created_by"
(
 "movie_id"  numeric(4) NOT NULL,
 "member_id" numeric(4) NOT NULL,
 CONSTRAINT "FK_25" FOREIGN KEY ( "movie_id" ) REFERENCES "Movie" ( "movie_id" ),
 CONSTRAINT "FK_29" FOREIGN KEY ( "member_id" ) REFERENCES "Crew_members" ( "member_id" )
);

CREATE INDEX "fkIdx_25" ON "created_by"
(
 "movie_id"
);

CREATE INDEX "fkIdx_29" ON "created_by"
(
 "member_id"
);

CREATE TABLE "directs"
(
 "dir_id"   numeric(4) NOT NULL,
 "movie_id" numeric(4) NOT NULL,
 CONSTRAINT "PK_directs" PRIMARY KEY ( "movie_id" ),
 CONSTRAINT "FK_12" FOREIGN KEY ( "dir_id" ) REFERENCES "Director" ( "dir_id" ),
 CONSTRAINT "FK_16" FOREIGN KEY ( "movie_id" ) REFERENCES "Movie" ( "movie_id" )
);

CREATE INDEX "fkIdx_12" ON "directs"
(
 "dir_id"
);

CREATE INDEX "fkIdx_16" ON "directs"
(
 "movie_id"
);

CREATE TABLE "drafts"
(
 "pro_id"    numeric(4) NOT NULL,
 "budget_id" numeric(4) NOT NULL,
 CONSTRAINT "PK_decides" PRIMARY KEY ( "pro_id" ),
 CONSTRAINT "FK_90" FOREIGN KEY ( "pro_id" ) REFERENCES "Producer" ( "pro_id" ),
 CONSTRAINT "FK_93" FOREIGN KEY ( "budget_id" ) REFERENCES "Budget" ( "budget_id" )
);

CREATE INDEX "fkIdx_90" ON "drafts"
(
 "pro_id"
);

CREATE INDEX "fkIdx_93" ON "drafts"
(
 "budget_id"
);


CREATE TABLE "loans_from"
(
 "pro_id" numeric(4) NOT NULL,
 "fin_id" numeric(4) NOT NULL,
 CONSTRAINT "PK_borrows_from" PRIMARY KEY ( "pro_id" ),
 CONSTRAINT "FK_103" FOREIGN KEY ( "pro_id" ) REFERENCES "Producer" ( "pro_id" ),
 CONSTRAINT "FK_107" FOREIGN KEY ( "fin_id" ) REFERENCES "Financier" ( "fin_id" )
);

CREATE INDEX "fkIdx_103" ON "loans_from"
(
 "pro_id"
);

CREATE INDEX "fkIdx_107" ON "loans_from"
(
 "fin_id"
);

CREATE TABLE "performed_by"
(
 "movie_id" numeric(4) NOT NULL,
 "actor_id" numeric(4) NOT NULL,
 CONSTRAINT "FK_117" FOREIGN KEY ( "movie_id" ) REFERENCES "Movie" ( "movie_id" ),
 CONSTRAINT "FK_120" FOREIGN KEY ( "actor_id" ) REFERENCES "Cast_members" ( "actor_id" )
);

CREATE INDEX "fkIdx_117" ON "performed_by"
(
 "movie_id"
);

CREATE INDEX "fkIdx_120" ON "performed_by"
(
 "actor_id"
);

CREATE TABLE "released_on"
(
 "movie_id"    numeric(4) NOT NULL,
 "platform_id" numeric(4) NOT NULL,
 CONSTRAINT "FK_56" FOREIGN KEY ( "movie_id" ) REFERENCES "Movie" ( "movie_id" ),
 CONSTRAINT "FK_60" FOREIGN KEY ( "platform_id" ) REFERENCES "Platform" ( "platform_id" )
);

CREATE INDEX "fkIdx_56" ON "released_on"
(
 "movie_id"
);

CREATE INDEX "fkIdx_60" ON "released_on"
(
 "platform_id"
);
