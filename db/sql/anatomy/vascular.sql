-- 

-- DROP TABLE vascular IF EXISTS;

CREATE TABLE vascular (
    vascular_id         SERIAL PRIMARY KEY,
    vascular_type       varchar CONSTRAINT IN ('vein', 'artery'),
    vascular_name       varchar NOT NULL,
    parent_vascular_id  INTEGER REFERENCES vascular(vascular_id),
    region_id           INTEGER REFERENCES region  (region_id) NOT NULL
);

