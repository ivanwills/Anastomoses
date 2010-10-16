-- 

-- DROP TABLE joint IF EXISTS;

CREATE TABLE joint (
    joint_id    SERIAL PRIMARY KEY,
    nerve_id    INTEGER REFERENCES nerve   (nerve_id   ),
    movement_id INTEGER REFERENCES movement(movement_id),
    feature_id  INTEGER REFERENCES feature (feature_id ),
    joint       varchar,
    joint_class varchar,
    joint_type  varchar
);
