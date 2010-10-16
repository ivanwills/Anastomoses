--

-- DROP TABLE IF EXISTS region;

CREATE TABLE anatomy.region (
    region_id        SERIAL PRIMARY KEY,
    region           varchar,
    praent_region_id INTEGER REFERENCES anatomy.region(region_id)
);

COMMENT ON TABLE  anatomy.region                  IS '';
COMMENT ON COLUMN anatomy.region.region_id        IS '';
COMMENT ON COLUMN anatomy.region.region           IS '';
COMMENT ON COLUMN anatomy.region.praent_region_id IS '';
