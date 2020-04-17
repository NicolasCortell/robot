CREATE TABLE robot.robot_accessory (
    /*UNSIGNED is a number always positif*/
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  id_robot INT NOT NULL,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_robot FOREIGN KEY (id_robot) REFERENCES robot.robot(id)
)
ENGINE = INNODB;

INSERT INTO robot.robot_accessory VALUES
