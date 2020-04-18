CREATE TABLE robot.recipe_ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_ingredient INT NOT NULL,
  detail TEXT,
  quantity INT(2) NOT NULL,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_recipe FOREIGN KEY (id_recipe) REFERENCES robot.recipe(id),
  CONSTRAINT fk_ingredient FOREIGN KEY (id_ingredient) REFERENCES robot.ingredient(id)
)
ENGINE = INNODB;

INSERT INTO robot.recipe_ingredient VALUES