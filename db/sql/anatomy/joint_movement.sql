--

-- DROP TABLE IF EXISTS joint_movement;

CREATE TABLE joint_movement (
    joint_id           INTEGER REFERENCES joint   (joint_id   ),
    movement_id        INTEGER REFERENCES movement(movement_id),
    UNIQUE(joint_id, movement_id)
);

COMMENT ON TABLE  joint_movement                   IS '';
COMMENT ON COLUMN joint_movement.joint_id          IS '';
COMMENT ON COLUMN joint_movement.movement_id       IS '';

