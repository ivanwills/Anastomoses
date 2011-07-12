--

-- DROP TABLE IF EXISTS muscle;

CREATE TABLE muscle (
    muscle_id    SERIAL PRIMARY KEY,
    compartment  varchar CHECK(
        compartment IN (
            'adductor tubercle',
            'anterior arm',
            'anterior axioappendicular',
            'anterior intermediate forearm',
            'anterior superficial forearm',
            'anterior deep forearm',
            'anterior thigh',
            'deep anterior forearm',
            'deep posterior axioappendicular',
            'gluteal',
            'hypothenar intrinsic',
            'intrinsic',
            'intrinsic hand',
            'medial thigh',
            'posterior arm',
            'posterior deep forearm',
            'posterior superficial forearm',
            'posterior thigh',
            'scapulohumeral',
            'superficial posterior axioappendicular',
            'thenar intrinsic'
        )
    ),
    joint_id         INTEGER REFERENCES joint   (joint_id   ),
    movement_id      INTEGER REFERENCES movement(movement_id),
    muscle           varchar NOT NULL,
    muscle_group     varchar,
    muscle_origin    varchar,
    muscle_insertion varchar,
    muscle_action    varchar,
    region_id        INTEGER REFERENCES region  (region_id  )
);

COMMENT ON TABLE  muscle                  IS '';
COMMENT ON COLUMN muscle.muscle_id        IS '';
COMMENT ON COLUMN muscle.compartment      IS '';
COMMENT ON COLUMN muscle.joint_id         IS '';
COMMENT ON COLUMN muscle.movement_id      IS '';
COMMENT ON COLUMN muscle.muscle           IS '';
COMMENT ON COLUMN muscle.compartment      IS '';
COMMENT ON COLUMN muscle.muscle_group     IS '';
COMMENT ON COLUMN muscle.muscle_origin    IS '';
COMMENT ON COLUMN muscle.muscle_insertion IS '';
COMMENT ON COLUMN muscle.muscle_action    IS '';
COMMENT ON COLUMN muscle.region_id        IS '';
