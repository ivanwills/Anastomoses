-- bones

-- DROP TABLE IF EXISTS bone;

CREATE TABLE anatomy.bone (
    bone_id             SERIAL PRIMARY KEY,
    bone_group          varchar,
    region_id           INTEGER REFERENCES anatomy.region(region_id),
    joint_id            INTEGER REFERENCES anatomy.joint (joint_id ),
    articulation        varchar,
    bone                varchar,
    muscle_insertions   varchar
);


COMMENT ON TABLE  anatomy.bone                   IS '';
COMMENT ON COLUMN anatomy.bone.bone_group        IS '';
COMMENT ON COLUMN anatomy.bone.region_id         IS '';
COMMENT ON COLUMN anatomy.bone.joint_id          IS '';
COMMENT ON COLUMN anatomy.bone.articulation      IS '';
COMMENT ON COLUMN anatomy.bone.bone              IS '';
COMMENT ON COLUMN anatomy.bone.muscle_insertions IS '';
