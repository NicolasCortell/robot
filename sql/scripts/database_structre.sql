CREATE DATABASE blend_eat
CHARACTER SET utf8
COLLATE utf8_bin;

-- ingredient_category

CREATE TABLE ingredient_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO ingredient_category (name) VALUES ('Viande');
INSERT INTO ingredient_category (name) VALUES ('Poisson');
INSERT INTO ingredient_category (name) VALUES ('Laitage');
INSERT INTO ingredient_category (name) VALUES ('Fruit');
INSERT INTO ingredient_category (name) VALUES ('Légumes');

-- season

CREATE TABLE season (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL  COLLATE utf8_general_ci,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO season (name) VALUES ('Printemps');
INSERT INTO season (name) VALUES ('Été');
INSERT INTO season (name) VALUES ('Automne');
INSERT INTO season (name) VALUES ('Hiver');

-- ingredient

CREATE TABLE ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (50)  COLLATE utf8_general_ci,
  id_ingredient_category INT NOT NULL,
  is_vegan BOOLEAN,
  detail TEXT,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__ingredient__ingredient_category FOREIGN KEY (id_ingredient_category) REFERENCES ingredient_category(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO ingredient (name,id_ingredient_category,is_vegan,detail) VALUES ('Banane','4','1','');
INSERT INTO ingredient (name,id_ingredient_category,is_vegan,detail) VALUES ('Pomme','4','1','');
INSERT INTO ingredient (name,id_ingredient_category,is_vegan,detail) VALUES ('Cote de porc','1','0','');

-- ingredient_season

CREATE TABLE ingredient_season (
  id INT NOT NULL AUTO_INCREMENT,
  id_ingredient INT NOT NULL,
  id_season INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__ingredient_season__ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id),
  CONSTRAINT fk__ingredient_season__season FOREIGN KEY (id_season) REFERENCES season(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO ingredient_season (id_ingredient,id_season) VALUES ('1','2');
INSERT INTO ingredient_season (id_ingredient,id_season) VALUES ('1','2');
INSERT INTO ingredient_season (id_ingredient,id_season) VALUES ('1','2');
INSERT INTO ingredient_season (id_ingredient,id_season) VALUES ('1','2');

-- media

CREATE TABLE media (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50)  COLLATE utf8_general_ci,
  media_path VARCHAR(50) COLLATE utf8_general_ci,
  table_name VARCHAR (50),
  id_external INT NOT NULL,
  
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


-- recipe_category

CREATE TABLE recipe_category (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL  COLLATE utf8_general_ci,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO recipe_category (name) VALUES ('Entrée');
INSERT INTO recipe_category (name) VALUES ('Plat');
INSERT INTO recipe_category (name) VALUES ('Dessert');
INSERT INTO recipe_category (name) VALUES ('Boisson');
INSERT INTO recipe_category (name) VALUES ('Vegan');


-- recipe

CREATE TABLE recipe (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe_category INT NOT NULL,
  name VARCHAR(50) NOT NULL  COLLATE utf8_general_ci,
  duration INT(3), 
  quantity INT(2) NOT NULL, 
  detail TEXT  COLLATE utf8_general_ci,
  creation_date DATE,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe__recipe_category FOREIGN KEY (id_recipe_category) REFERENCES recipe_category(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO recipe (id_recipe_category,name,duration,quantity,detail,creation_date) VALUES ('1','Cake aux olives','15','4','Une super entrée pour toute la famille',UTC_TIMESTAMP());
 
-- recipe_ingredient

CREATE TABLE recipe_ingredient (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_ingredient INT NOT NULL,
  detail TEXT COLLATE utf8_general_ci,
  quantity INT NOT NULL,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_ingredient__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_ingredient__ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO recipe_ingredient (id_recipe,id_ingredient,detail,quantity) VALUES ('1','1','bananes entières','4');
INSERT INTO recipe_ingredient (id_recipe,id_ingredient,detail,quantity) VALUES ('1','3','côtes de porc','2');

-- robot

CREATE TABLE robot (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,
  PRIMARY KEY (id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO robot (name) VALUES ('Thermomix'), ('Cookéo');

-- recipe_robot

CREATE TABLE recipe_robot (
  id INT NOT NULL AUTO_INCREMENT,
  id_recipe INT NOT NULL,
  id_robot INT NOT NULL,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_robot__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_robot__robot FOREIGN KEY (id_robot) REFERENCES robot(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO recipe_robot (id_recipe, id_robot) VALUES (1,1),(1,2);


-- accessory

CREATE TABLE accessory (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL COLLATE utf8_general_ci,
  PRIMARY KEY (id),
  INDEX(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO accessory (name) VALUES 
('Fouet'), ('Spatule'), ('Lames');


-- robot_accessory

CREATE TABLE robot_accessory (
  id INT NOT NULL AUTO_INCREMENT,
  id_accessory INT NOT NULL,
  id_robot INT NOT NULL,
  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__robot_accessory__robot FOREIGN KEY (id_robot) REFERENCES robot(id),
  CONSTRAINT fk__robot_accessory__accessory FOREIGN KEY (id_accessory) REFERENCES accessory(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO robot_accessory (id_accessory, id_robot) VALUES 
(1, 1), (2,1), (3,1),
(1, 2), (2,2), (3,2);


-- recipe_step

CREATE TABLE recipe_step (
  id INT NOT NULL AUTO_INCREMENT,
  step INT NOT NULL,
  detail VARCHAR(100) NOT NULL COLLATE utf8_general_ci,
  id_recipe INT NOT NULL,
  id_accessory INT,

  PRIMARY KEY (id),
  INDEX(id),
  CONSTRAINT fk__recipe_step__recipe FOREIGN KEY (id_recipe) REFERENCES recipe(id),
  CONSTRAINT fk__recipe_step__accessory FOREIGN KEY (id_accessory) REFERENCES accessory(id)
)
ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO recipe_step (step, detail, id_recipe, id_accessory) VALUES 
(1, 'Peler les bananes', 1, NULL),
(2, 'Peler les bananes', 1, NULL),
(3, 'Peler les bananes', 1, NULL);

