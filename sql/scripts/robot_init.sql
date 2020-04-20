CREATE TABLE robot.robot (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)
CHARACTER SET utff8,
COLLATE utf8_unicode_ci;

INSERT INTO robot.robot VALUES (1,'à'),(2,'ok'),(3,'é'),(4,'aaa');