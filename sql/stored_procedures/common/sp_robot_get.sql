DROP PROCEDURE IF EXISTS sp_robot_get;
DELIMITER $$

CREATE PROCEDURE sp_robot_get()
BEGIN
    SELECT *
    FROM robot
    ORDER BY name;
END $$

DELIMITER ;