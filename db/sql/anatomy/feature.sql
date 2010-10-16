-- 

-- DROP TABLE feature IF EXISTS;

CREATE TABLE feature (
    feature_id         SERIAL PRIMARY KEY,
    feature_type       varchar NOT NULL CONSTRAINT
        feature_type_c IN (
            'anatomical area',
            'ligament',
            'boney feature',
            'sinus'
            'retinaculum',
            'aponeurosis',
            'foramen',
            'crease',
            'extensor hood'
        ),
    feature_subtype	varchar	CONSTRAINT
        featuresubtype_c IN (
            'fossa'
            'process'
            'facet'
            'tubercle'
            'tuberosity'
            'anastomoses',
            'notch',
            'labrum'
        ),
    feature            varchar NOT NULL,
    feature_desc       varchar NOT NULL,
    feature_loc        varchar NOT NULL,
    feature_insertion  varchar,
    feature_origin     varchar,
    region_id          INTEGER REFERENCES region(region_id) NOT NULL,
    bone_id            INTEGER REFERENCES bone  (bone_id  ),
    nerve_id           INTEGER REFERENCES nerve (nerve_id ),
    joint_id           INTEGER REFERENCES joint (joint_id ),
    lateral_border     varchar,
    medial_border      varchar,
    floor              varchar,
    apex               varchar,
    base               varchar
);
COMMENT ON TABLE  bone                    IS '';
COMMENT ON COLUMN bone.category           IS '';
COMMENT ON COLUMN bone.parent_category_id IS '';
