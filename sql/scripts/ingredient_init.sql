CREATE TABLE robot.ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (10),
  id_ingredient_category INT NOT NULL,
  is_vegan TEXT,
  detail TEXT,
  id_season INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk_ingredient_category FOREIGN KEY (id_ingredient_category) REFERENCES robot.ingredient_category(id),
  CONSTRAINT fk_season FOREIGN KEY (id_season) REFERENCES robot.season(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_bin;

INSERT INTO robot.ingredient VALUES