CREATE TABLE robot.recipe_robot (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_robot INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_recipe FOREIGN KEY (id_recipe) REFERENCES robot.recipe(id),
  CONSTRAINT fk_robot FOREIGN KEY (id_robot) REFERENCES robot.robot(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_bin;

INSERT INTO robot.recipe_robot VALUES
