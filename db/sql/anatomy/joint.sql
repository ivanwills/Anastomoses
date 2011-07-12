--

-- DROP TABLE IF EXISTS joint;

CREATE TABLE joint (
    joint_id    SERIAL PRIMARY KEY,
    neurovascular_id    INTEGER REFERENCES neurovascular   (neurovascular_id   ),
    joint       varchar,
    joint_class varchar,
    joint_type  varchar
);

COMMENT ON TABLE  joint                  IS '';
COMMENT ON COLUMN joint.joint_id         IS '';
COMMENT ON COLUMN joint.neurovascular_id IS '';
COMMENT ON COLUMN joint.joint            IS '';
COMMENT ON COLUMN joint.joint_class      IS '';
COMMENT ON COLUMN joint.joint_type       IS '';
