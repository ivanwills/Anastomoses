-- 

-- DROP TABLE region IF EXISTS;

CREATE TABLE region (
    region_id        SERIAL PRIMARY KEY,
    region           varchar,
    praent_region_id INTEGER REFERENCES region(region_id),
    subregion        varchar
);

