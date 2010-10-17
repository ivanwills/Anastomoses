--

-- DROP TABLE IF EXISTS muscle;

CREATE TABLE muscle (
    muscle_id    SERIAL PRIMARY KEY,
    joint_id     INTEGER REFERENCES joint   (joint_id   ),
    nerve_id     INTEGER REFERENCES nerve   (nerve_id   ),
    movement_id  INTEGER REFERENCES movement(movement_id),
    muscle       varchar NOT NULL,
    muscle_group varchar,
    origin       varchar,
    insertion    varchar,
    action       varchar,
    region_id    INTEGER REFERENCES region  (region_id  )
);

COMMENT ON TABLE  muscle              IS '';
COMMENT ON COLUMN muscle.muscle_id    IS '';
COMMENT ON COLUMN muscle.joint_id     IS '';
COMMENT ON COLUMN muscle.nerve_id     IS '';
COMMENT ON COLUMN muscle.movement_id  IS '';
COMMENT ON COLUMN muscle.muscle       IS '';
COMMENT ON COLUMN muscle.muscle_group IS '';
COMMENT ON COLUMN muscle.origin       IS '';
COMMENT ON COLUMN muscle.insertion    IS '';
COMMENT ON COLUMN muscle.action       IS '';
COMMENT ON COLUMN muscle.region_id    IS '';
