-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema unha
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `unha` ;

-- -----------------------------------------------------
-- Schema unha
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `unha` DEFAULT CHARACTER SET utf8 ;
USE `unha` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NULL,
  `apartment` VARCHAR(45) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(100) NULL,
  `state_abbreviation` CHAR(2) NULL,
  `zip_code` INT NULL,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NULL,
  `role_id` INT NULL DEFAULT 1,
  `password` VARCHAR(200) NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `phone` INT NULL,
  `image_url` VARCHAR(500) NULL DEFAULT 'default.png',
  `active` TINYINT NULL DEFAULT 1,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `role_id_idx` (`role_id` ASC),
  CONSTRAINT `FK_user_address_id`
    FOREIGN KEY (`id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_subject` ;

CREATE TABLE IF NOT EXISTS `event_subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(200) NULL,
  `img_url` VARCHAR(200) NULL DEFAULT 'default.jpg',
  `user_id` INT NULL,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `flag_content` TINYINT NULL DEFAULT 0,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `FK_event_subject_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `description` TEXT(5000) NULL,
  `event_subject_id` INT NULL,
  `start_time` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `finish_time` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `image_url` VARCHAR(200) NULL,
  `address_id` INT NULL,
  `open` TINYINT NULL DEFAULT 1,
  `max_size` INT NULL DEFAULT 10,
  `rideshare` TINYINT NULL DEFAULT 0,
  `user_id` INT NULL,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `address_id_idx` (`address_id` ASC),
  INDEX `FK_event_event_subject_id_idx` (`event_subject_id` ASC),
  CONSTRAINT `FK_event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_event_subject_id`
    FOREIGN KEY (`event_subject_id`)
    REFERENCES `event_subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `event_rating` INT NULL DEFAULT 5,
  `flag_content` TINYINT NULL DEFAULT 0,
  `active` TINYINT NULL DEFAULT 1,
  `host_rating` INT NULL DEFAULT 5,
  `event_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `FK_user_event_event_id_idx` (`event_id` ASC),
  CONSTRAINT `FK_user_event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_event_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `body` TEXT(2000) NULL,
  `flag_content` TINYINT NULL DEFAULT 0,
  `date_created` DATETIME NULL DEFAULT  CURRENT_TIMESTAMP,
  `in_reply_to` INT NULL DEFAULT 0,
  `active` TINYINT NULL DEFAULT 1,
  `user_event_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_comment_comment_in_reply_to_idx` (`in_reply_to` ASC),
  INDEX `FK_comment_user_event_id_idx` (`user_event_id` ASC),
  CONSTRAINT `FK_comment_comment_in_reply_to`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_comment_user_event_id`
    FOREIGN KEY (`user_event_id`)
    REFERENCES `user_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS unha@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'unha'@'localhost' IDENTIFIED BY 'unha';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'unha'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (1, '123 Street', 'A', 'Cartersville', 'Georgia', 'GA', 12345, '2019-03-05 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (2, '234 Street', 'B', 'New York', 'New York', 'NY', 23456, '2019-03-06 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (3, '345 Street', 'C', 'Denver', 'Colorado', 'CO', 34567, '2019-03-07 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (4, '456 Street', 'D', 'Jersey City', 'New Jersey', 'NJ', 45678, '2019-03-08 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (5, '18300 W Alameda Pkwy', 'NULL', 'Morrison', 'Colorado', 'CO', 80465, '2019-03-09 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (6, '4600 Humboldt Street', 'NULL', 'Denver', 'Colorado', 'CO', 80216, '2019-03-10 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (7, '1350 Curtis Street', 'NULL', 'Denver', 'Colorado', 'CO', 80202, '2019-03-11 16:19:25');
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (8, '345 Oakridge Drive', 'NULL', 'Cartersville', 'Georgia', 'GA', 30121, '2019-03-12 16:19:25');

COMMIT;


-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `role` (`id`, `name`) VALUES (1, 'user');
INSERT INTO `role` (`id`, `name`) VALUES (2, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (1, 1, 2, '1234', 'Admin', 'Admin', 'admin@admin.com', 123456789, 'NULL', 1, '2019-03-12 16:19:25');
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (2, 2, 2, '2345', 'Eric', 'Vasquez', 'eric@eric.com', 234567890, 'NULL', 1, '2019-03-12 16:19:25');
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (3, 3, 2, '3456', 'Anna', 'Jimenez', 'anna@anna.com', 345678901, 'NULL', 1, '2019-03-12 16:19:25');
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (4, 4, 1, '4567', 'Bella', 'Jimenez', 'bella@bella.com', 456789012, 'NULL', 1, '2019-03-12 16:19:25');
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (5, 1, 2, '1234', 'Todd', 'Trowbridge', 'todd@todd.com', 567890123, 'NULL', 1, '2019-03-13 16:19:25');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (1, 'Metallica', 'NULL', 1, '2019-03-09 18:00:00', 0, 1);
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (2, 'Blink 182', 'NULL', 2, '2019-03-10 18:00:00', 0, 1);
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (3, 'The Chainsmokers', 'NULL', 3, '2019-03-11 18:00:00', 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (1, 'Metallica at Red Rocks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, '2019-03-15 19:00:00', '2019-03-15 22:00:00', 'NULL', 5, 1, 5, 1, 1, '2019-03-12 16:19:25', 1);
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (2, 'Blink 182 at Denver Coliseum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2, '2019-03-17 18:00:00', '2019-03-17 22:00:00', 'NULL', 6, 1, 10, 0, 2, '2019-03-12 16:19:25', 1);
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (3, 'Chainsmokers at Buell Theatre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3, '2019-03-19 18:30:00', '2019-03-19 22:00:00', 'NULL', 7, 1, 99, 1, 3, '2019-03-12 16:19:25', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (1, 1, '2019-03-12 16:19:25', 5, 0, 1, NULL, 1);
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (2, 2, '2019-03-12 16:19:25', 5, 0, 1, NULL, 2);
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (3, 3, '2019-03-12 16:19:25', 5, 0, 1, NULL, 3);

COMMIT;

