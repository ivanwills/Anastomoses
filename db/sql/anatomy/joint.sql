--

-- DROP TABLE IF EXISTS joint;

CREATE TABLE joint (
    joint_id    SERIAL PRIMARY KEY,
    nerve_id    INTEGER REFERENCES nerve   (nerve_id   ),
    feature_id  INTEGER, -- REFERENCES feature (feature_id ),
    joint       varchar,
    joint_class varchar,
    joint_type  varchar
);

COMMENT ON TABLE  joint             IS '';
COMMENT ON COLUMN joint.joint_id    IS '';
COMMENT ON COLUMN joint.nerve_id    IS '';
COMMENT ON COLUMN joint.feature_id  IS '';
COMMENT ON COLUMN joint.joint       IS '';
COMMENT ON COLUMN joint.joint_class IS '';
COMMENT ON COLUMN joint.joint_type  IS '';
