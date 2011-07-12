-- Create the joint_feature table and initial contents

-- DROP TABLE joint_feature;

CREATE TABLE joint_feature (
    joint_feature_id SERIAL PRIMARY KEY,
    joint_id         INTEGER REFERENCES joint  (joint_id ) NOT NULL,
    feature_id       INTEGER REFERENCES feature (feature_id) NOT NULL,
    UNIQUE(joint_id, feature_id)
);

COMMENT ON TABLE  joint_feature             IS '';
COMMENT ON COLUMN joint_feature.joint_id    IS '';
COMMENT ON COLUMN joint_feature.feature_id  IS '';
