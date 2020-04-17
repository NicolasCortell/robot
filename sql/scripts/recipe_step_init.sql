CREATE TABLE robot.recipe_step (
  id INT NOT NULL AUTO_INCREMENT,
  index INT NOT NULL,
  detail VARCHAR(50) NOT NULL,
  id_recipe INT NOT NULL,
  id_robot_accessory INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_id_recipe FOREIGN KEY (id_recipe) REFERENCES robot.recipe(id),
  CONSTRAINT fk_id_robot_accessory FOREIGN KEY (id_robot_accessory) REFERENCES robot.robot_accessory(id)
)
ENGINE = INNODB;

INSERT INTO robot.recipe_step VALUES
