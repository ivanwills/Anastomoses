-- bones

-- DROP TABLE bone IF EXISTS;

CREATE TABLE bone (
    bone_id             SERIAL PRIMARY KEY,
    bone_group          varchar,
    region_id           INTEGER REFERENCES region(region_id),
    joint_id            INTEGER REFERENCES joint (joint_id ),
    articulation        varchar,
    bone                varchar,
    muscle_insertions   varchar
);


COMMENT ON TABLE  bone                    IS '';
COMMENT ON COLUMN bone.category           IS '';
COMMENT ON COLUMN bone.parent_category_id IS '';
