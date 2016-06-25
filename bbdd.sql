/* CREATION OT THE DATABASE AND ITS TABLES*/
DROP DATABASE IF EXISTS `gestionConvenios`;
CREATE DATABASE IF NOT EXISTS `gestionConvenios`;
USE `gestionConvenios`;

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

  -- Basic info
  `nom` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `localitzacio` VARCHAR(50) NOT NULL,

  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `usuari` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

  -- Basic info
  `nom` VARCHAR(50) NOT NULL,
  `cognom` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefon` VARCHAR(15) NOT NULL,
  `localitzacio` VARCHAR(50) NOT NULL,
  `tipus` TINYINT NOT NULL,
  	/* Valors tipus:
		0 = Cap d'estudis
		1 = Tutor UIB
		2 = Tutor Empresa
		3 = DOIP
  	*/

  -- Security info
  `password` CHAR(128) NOT NULL,
  `xifrat` CHAR(128) NOT NULL,

  -- Database info
  `data_creacio` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tutor_empresa` (
  `id_usuari` INT UNSIGNED NOT NULL,
  `id_empresa` INT UNSIGNED,

  FOREIGN KEY (`id_usuari`) REFERENCES `usuari`(`id`),
  FOREIGN KEY (`id_empresa`) REFERENCES `empresa`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `conveni` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,

  -- Responsables
  `id_tutor_UIB` INT UNSIGNED NOT NULL,
  `id_tutor_empresa` INT UNSIGNED NOT NULL,
  `id_cap_estudis` INT UNSIGNED NOT NULL,

  -- Basic info
  `ocupacio` VARCHAR(50) NOT NULL,
  `oferta` VARCHAR(256) NOT NULL,
  `perfil` VARCHAR(256) NOT NULL,
  `formacio` VARCHAR(256) NOT NULL,
  `seguiment` VARCHAR(256) NOT NULL,

  `data_inici` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `data_fi` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  `direccio` VARCHAR(50) NOT NULL,
  `places` INT(2) NOT NULL,
  `hores` INT(3) NOT NULL,
  `renumeracio` INT(4) NOT NULL,

  -- Alumne info
  `nom` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,

  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (`id_tutor_UIB`) REFERENCES `usuari`(`id`),
  FOREIGN KEY (`id_tutor_empresa`) REFERENCES `usuari`(`id`),
  FOREIGN KEY (`id_cap_estudis`) REFERENCES `usuari`(`id`)
) ENGINE = InnoDB;

-- CREATION OF DATA CELLS AND ROWS OF TABLES
INSERT INTO `usuari`(`nom`, `cognom`, `email`, `telefon`, `localitzacio`, `tipus`, `password`, `xifrat`) VALUES
	('carlos', 'marin fernandez', 'carlosmarinfernandez@gmail.com', '665325197', 'palma de mallorca', 1,
	'00807432eae173f652f2064bdca1b61b290b52d40e429a7d295d76a71084aa96c0233b82f1feac45529e0726559645acaed6f3ae58a286b9f075916ebf66cacc',
	'f9aab579fc1b41ed0c44fe4ecdbfcdb4cb99b9023abb241a6db833288f4eea3c02f76e0d35204a8695077dcf81932aa59006423976224be0390395bae152d4ef'
	);