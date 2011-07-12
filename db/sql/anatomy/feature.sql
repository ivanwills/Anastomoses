--

-- DROP TABLE IF EXISTS feature;

CREATE TABLE feature (
    feature_id         SERIAL PRIMARY KEY,
    feature_type       varchar NOT NULL CHECK(
            feature_type IN (
                'anatomical area',
                'ligament',
                'boney feature',
                'sinus'
                'retinaculum',
                'aponeurosis',
                'foramen',
                'crease',
                'extensor hood'
            )
        ),
    feature_subtype    varchar CHECK(
            feature_subtype IN (
                'fossa',
                'process',
                'facet',
                'tubercle',
                'tuberosity',
                'anastomoses',
                'notch',
                'labrum'
            )
        ),
    feature             varchar NOT NULL,
    feature_description varchar NOT NULL,
    feature_location    varchar NOT NULL,
    feature_insertion   varchar,
    feature_origin      varchar,
    bone_id             INTEGER REFERENCES bone  (bone_id  ),
    region_id           INTEGER REFERENCES region(region_id) NOT NULL,
    neurovascular_id    INTEGER REFERENCES neurovascular (neurovascular_id ),
    lateral_border      varchar,
    medial_border       varchar,
    feature_floor       varchar,
    feature_apex        varchar,
    feature_base        varchar,
    anterior_margin     varchar,
    posterior_margin    varchar
);

COMMENT ON TABLE  feature                     IS '';
COMMENT ON COLUMN feature.feature_id          IS '';
COMMENT ON COLUMN feature.feature_type        IS '';
COMMENT ON COLUMN feature.feature_subtype     IS '';
COMMENT ON COLUMN feature.feature             IS '';
COMMENT ON COLUMN feature.feature_description IS '';
COMMENT ON COLUMN feature.feature_location    IS '';
COMMENT ON COLUMN feature.feature_insertion   IS '';
COMMENT ON COLUMN feature.feature_origin      IS '';
COMMENT ON COLUMN feature.region_id           IS '';
COMMENT ON COLUMN feature.bone_id             IS '';
COMMENT ON COLUMN feature.neurovascular_id    IS '';
COMMENT ON COLUMN feature.lateral_border      IS '';
COMMENT ON COLUMN feature.medial_border       IS '';
COMMENT ON COLUMN feature.feature_floor       IS '';
COMMENT ON COLUMN feature.feature_apex        IS '';
COMMENT ON COLUMN feature.feature_base        IS '';
