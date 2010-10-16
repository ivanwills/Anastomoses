--

-- DROP TABLE IF EXISTS muscle;

CREATE TABLE anatomy.muscle (
    muscle_id    SERIAL PRIMARY KEY,
    joint_id     INTEGER REFERENCES anatomy.joint   (joint_id   ),
    nerve_id     INTEGER REFERENCES anatomy.nerve   (nerve_id   ),
    movement_id  INTEGER REFERENCES anatomy.movement(movement_id),
    muscle       varchar NOT NULL,
    muscle_group varchar,
    origin       varchar,
    insertion    varchar,
    action       varchar,
    region_id    INTEGER REFERENCES anatomy.region  (region_id  )
);

COMMENT ON TABLE  anatomy.muscle              IS '';
COMMENT ON COLUMN anatomy.muscle.muscle_id    IS '';
COMMENT ON COLUMN anatomy.muscle.joint_id     IS '';
COMMENT ON COLUMN anatomy.muscle.nerve_id     IS '';
COMMENT ON COLUMN anatomy.muscle.movement_id  IS '';
COMMENT ON COLUMN anatomy.muscle.muscle       IS '';
COMMENT ON COLUMN anatomy.muscle.muscle_group IS '';
COMMENT ON COLUMN anatomy.muscle.origin       IS '';
COMMENT ON COLUMN anatomy.muscle.insertion    IS '';
COMMENT ON COLUMN anatomy.muscle.action       IS '';
COMMENT ON COLUMN anatomy.muscle.region_id    IS '';
