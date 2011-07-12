--

-- DROP TABLE IF EXISTS neurovascular;

CREATE TABLE neurovascular (
    neurovascular_id         SERIAL PRIMARY KEY,
    neurovascular_type       varchar CHECK( neurovascular_type IN ('vein', 'artery') ),
    neurovascular_name       varchar NOT NULL,
    parent_neurovascularlar_id  INTEGER REFERENCES neurovascular(neurovascular_id),
    region_id                   INTEGER REFERENCES region  (region_id) NOT NULL
);

COMMENT ON TABLE  neurovascular                            IS '';
COMMENT ON COLUMN neurovascular.neurovascular_id           IS '';
COMMENT ON COLUMN neurovascular.neurovascular_type         IS '';
COMMENT ON COLUMN neurovascular.neurovascular_name         IS '';
COMMENT ON COLUMN neurovascular.parent_neurovascularlar_id IS '';
COMMENT ON COLUMN neurovascular.region_id                  IS '';
