-- bones

-- DROP TABLE IF EXISTS bone;

CREATE TABLE bone (
    bone_id             SERIAL PRIMARY KEY,
    bone_group          varchar,
    region_id           INTEGER REFERENCES region(region_id),
    joint_id            INTEGER REFERENCES joint (joint_id ),
    articulation        varchar,
    bone                varchar,
    muscle_insertions   varchar
);


COMMENT ON TABLE  bone                   IS '';
COMMENT ON COLUMN bone.bone_group        IS '';
COMMENT ON COLUMN bone.region_id         IS '';
COMMENT ON COLUMN bone.joint_id          IS '';
COMMENT ON COLUMN bone.articulation      IS '';
COMMENT ON COLUMN bone.bone              IS '';
COMMENT ON COLUMN bone.muscle_insertions IS '';
