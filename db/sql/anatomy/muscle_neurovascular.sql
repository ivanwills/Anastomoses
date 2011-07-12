-- Create the muscle_neurovascular table and initial contents

-- DROP TABLE muscle_neurovascular;

CREATE TABLE muscle_neurovascular (
    muscle_neurovascular_id SERIAL PRIMARY KEY,
    muscle_id               INTEGER REFERENCES muscle  (muscle_id ) NOT NULL,
    neurovascular_id        INTEGER REFERENCES neurovascular (neurovascular_id) NOT NULL,
    UNIQUE(muscle_id, neurovascular_id)
);

COMMENT ON TABLE  muscle_neurovascular                         IS '';
COMMENT ON COLUMN muscle_neurovascular.muscle_id     IS '';
COMMENT ON COLUMN muscle_neurovascular.neurovascular_id    IS '';
