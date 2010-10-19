--

-- DROP TABLE IF EXISTS region;

CREATE TABLE region (
    region_id        SERIAL PRIMARY KEY,
    region           varchar,
    parent_region_id INTEGER REFERENCES region(region_id)
);

COMMENT ON TABLE  region                  IS '';
COMMENT ON COLUMN region.region_id        IS '';
COMMENT ON COLUMN region.region           IS '';
COMMENT ON COLUMN region.parent_region_id IS '';
