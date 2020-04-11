CREATE TABLE robot.civility (
  id INT(11) NOT NULL AUTO_INCREMENT,
  code VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
CHARACTER SET latin1,
CHECKSUM = 0,
COLLATE latin1_swedish_ci;

INSERT INTO robot.civility
(code)
VALUES
('MR'),
('MME'),
('MLLE'),
('MRS'),
('DR');
