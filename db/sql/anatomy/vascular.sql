--

-- DROP TABLE IF EXISTS vascular;

CREATE TABLE vascular (
    vascular_id         SERIAL PRIMARY KEY,
    vascular_type       varchar CHECK( vascular_type IN ('vein', 'artery') ),
    vascular_name       varchar NOT NULL,
    parent_vascular_id  INTEGER REFERENCES vascular(vascular_id),
    region_id           INTEGER REFERENCES region  (region_id) NOT NULL
);

COMMENT ON TABLE  vascular                    IS '';
COMMENT ON COLUMN vascular.vascular_id        IS '';
COMMENT ON COLUMN vascular.vascular_type      IS '';
COMMENT ON COLUMN vascular.vascular_name      IS '';
COMMENT ON COLUMN vascular.parent_vascular_id IS '';
COMMENT ON COLUMN vascular.region_id          IS '';
