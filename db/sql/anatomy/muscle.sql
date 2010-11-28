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
    joint_id     INTEGER REFERENCES joint   (joint_id   ),
    nerve_id     INTEGER REFERENCES nerve   (nerve_id   ),
    muscle       varchar NOT NULL,
    muscle_head  VARCHAR(255),
    muscle_group varchar,
    origin       varchar,
    insertion    varchar,
    action       varchar,
    region_id    INTEGER REFERENCES region  (region_id  )
);

COMMENT ON TABLE  muscle              IS '';
COMMENT ON COLUMN muscle.muscle_id    IS '';
COMMENT ON COLUMN muscle.compartment  IS '';
COMMENT ON COLUMN muscle.joint_id     IS '';
COMMENT ON COLUMN muscle.nerve_id     IS '';
COMMENT ON COLUMN muscle.muscle       IS '';
COMMENT ON COLUMN muscle.muscle_head  IS '';
COMMENT ON COLUMN muscle.muscle_group IS '';
COMMENT ON COLUMN muscle.origin       IS '';
COMMENT ON COLUMN muscle.insertion    IS '';
COMMENT ON COLUMN muscle.action       IS '';
COMMENT ON COLUMN muscle.region_id    IS '';
