--

-- DROP TABLE IF EXISTS joint;

CREATE TABLE anatomy.joint (
    joint_id    SERIAL PRIMARY KEY,
    nerve_id    INTEGER REFERENCES anatomy.nerve   (nerve_id   ),
    movement_id INTEGER REFERENCES anatomy.movement(movement_id),
    feature_id  INTEGER, -- REFERENCES anatomy.feature (feature_id ),
    joint       varchar,
    joint_class varchar,
    joint_type  varchar
);

COMMENT ON TABLE  anatomy.joint             IS '';
COMMENT ON COLUMN anatomy.joint.joint_id    IS '';
COMMENT ON COLUMN anatomy.joint.nerve_id    IS '';
COMMENT ON COLUMN anatomy.joint.movement_id IS '';
COMMENT ON COLUMN anatomy.joint.feature_id  IS '';
COMMENT ON COLUMN anatomy.joint.joint       IS '';
COMMENT ON COLUMN anatomy.joint.joint_class IS '';
COMMENT ON COLUMN anatomy.joint.joint_type  IS '';
