-- 

-- DROP TABLE muscle IF EXISTS;

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
