--

-- DROP TABLE IF EXISTS vascular;

CREATE TABLE anatomy.vascular (
    vascular_id         SERIAL PRIMARY KEY,
    vascular_type       varchar CHECK( vascular_type IN ('vein', 'artery') ),
    vascular_name       varchar NOT NULL,
    parent_vascular_id  INTEGER REFERENCES anatomy.vascular(vascular_id),
    region_id           INTEGER REFERENCES anatomy.region  (region_id) NOT NULL
);

COMMENT ON TABLE  anatomy.vascular                    IS '';
COMMENT ON COLUMN anatomy.vascular.vascular_id        IS '';
COMMENT ON COLUMN anatomy.vascular.vascular_type      IS '';
COMMENT ON COLUMN anatomy.vascular.vascular_name      IS '';
COMMENT ON COLUMN anatomy.vascular.parent_vascular_id IS '';
COMMENT ON COLUMN anatomy.vascular.region_id          IS '';
