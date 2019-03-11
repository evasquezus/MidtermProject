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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  `apartment` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `state` VARCHAR(100) NULL DEFAULT NULL,
  `state_abbreviation` CHAR(2) NULL DEFAULT NULL,
  `zip_code` INT(11) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address_id` INT(11) NULL DEFAULT NULL,
  `role_id` INT(11) NULL DEFAULT NULL,
  `password` VARCHAR(200) NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL DEFAULT NULL,
  `last_name` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `image_url` VARCHAR(500) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
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
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_subject` ;

CREATE TABLE IF NOT EXISTS `event_subject` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(200) NULL DEFAULT NULL,
  `img_url` VARCHAR(200) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `flag_content` TINYINT(4) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `FK_event_subject_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `event_subject_id` INT(11) NULL DEFAULT NULL,
  `start_time` DATETIME NULL DEFAULT NULL,
  `finish_time` DATETIME NULL DEFAULT NULL,
  `image_url` VARCHAR(200) NULL DEFAULT NULL,
  `address_id` INT(11) NULL DEFAULT NULL,
  `open` TINYINT(4) NULL DEFAULT NULL,
  `max_size` INT(11) NULL DEFAULT NULL,
  `rideshare` TINYINT(4) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `active` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `address_id_idx` (`address_id` ASC),
  INDEX `FK_event_event_subject_id_idx` (`event_subject_id` ASC),
  CONSTRAINT `FK_event_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_event_subject_id`
    FOREIGN KEY (`event_subject_id`)
    REFERENCES `event_subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `event_rating` INT(11) NULL DEFAULT NULL,
  `flag_content` TINYINT(4) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  `host_rating` INT(11) NULL DEFAULT NULL,
  `event_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `FK_user_event_event_id_idx` (`event_id` ASC),
  CONSTRAINT `FK_user_event_event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_event_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  `body` TEXT NULL DEFAULT NULL,
  `flag_content` TINYINT(4) NULL DEFAULT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `in_reply_to` INT(11) NULL DEFAULT NULL,
  `active` TINYINT(4) NULL DEFAULT NULL,
  `user_event_id` INT(11) NULL DEFAULT NULL,
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
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

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
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (1, '123 street', 'a', 'cartersville', 'georgia', 'ga', 12345, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (2, '234 street', 'b', 'new york', 'new york', 'ny', 23456, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (3, '345 street', 'c', 'denver', 'colorado', 'co', 34567, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (4, '456 street', 'd', 'jersey city', 'new jersey', 'nj', 45678, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (5, '18300 W Alameda Pkwy', 'NULL', 'morrison', 'colorado', 'co', 80465, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (6, '4600 Humboldt Street', 'NULL', 'denver', 'colorado', 'co', 80216, CURRENT_TIMESTAMP());
INSERT INTO `address` (`id`, `address`, `apartment`, `city`, `state`, `state_abbreviation`, `zip_code`, `date_created`) VALUES (7, '1350 Curtis Street', 'NULL', 'denver', 'colorado', 'co', 80202, CURRENT_TIMESTAMP());

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
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (1, 1, 2, '1234', 'todd', 'trowbridge', 'todd@todd.com', 123456789, 'NULL', 1, CURRENT_TIMESTAMP());
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (2, 2, 2, '2345', 'eric', 'vasquez', 'eric@eric.com', 234567890, 'NULL', 1, CURRENT_TIMESTAMP());
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (3, 3, 2, '3456', 'anna', 'jimenez', 'anna@anna.com', 345678901, 'NULL', 1, CURRENT_TIMESTAMP());
INSERT INTO `user` (`id`, `address_id`, `role_id`, `password`, `first_name`, `last_name`, `email`, `phone`, `image_url`, `active`, `date_created`) VALUES (4, 4, 1, '4567', 'bella', 'jimenez', 'bella@bella.com', 456789012, 'NULL', 1, CURRENT_TIMESTAMP());

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (1, 'metallica', 'NULL', 1, CURRENT_TIMESTAMP(), 0, 1);
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (2, 'blink 182', 'NULL', 2, CURRENT_TIMESTAMP(), 0, 1);
INSERT INTO `event_subject` (`id`, `event_name`, `img_url`, `user_id`, `date_created`, `flag_content`, `active`) VALUES (3, 'chainsmokers', 'NULL', 3, CURRENT_TIMESTAMP(), 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (1, 'metallica at red rocks', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 'NULL', 5, 1, 5, 1, 1, CURRENT_TIMESTAMP(), 1);
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (2, 'blink 182 at denver coliseum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 'NULL', 6, 1, 10, 0, 2, CURRENT_TIMESTAMP(), 1);
INSERT INTO `event` (`id`, `name`, `description`, `event_subject_id`, `start_time`, `finish_time`, `image_url`, `address_id`, `open`, `max_size`, `rideshare`, `user_id`, `date_created`, `active`) VALUES (3, 'chainsmokers at buell theatre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 'NULL', 7, 1, NULL, 1, 3, CURRENT_TIMESTAMP(), 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (1, 1, CURRENT_TIMESTAMP(), NULL, 0, 1, NULL, 1);
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (2, 2, CURRENT_TIMESTAMP(), NULL, 0, 1, NULL, 2);
INSERT INTO `user_event` (`id`, `user_id`, `date_created`, `event_rating`, `flag_content`, `active`, `host_rating`, `event_id`) VALUES (3, 3, CURRENT_TIMESTAMP(), NULL, 0, 1, NULL, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `unha`;
INSERT INTO `comment` (`id`, `title`, `body`, `flag_content`, `date_created`, `in_reply_to`, `active`, `user_event_id`) VALUES (1, 'first comment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, CURRENT_TIMESTAMP(), 1, 1, 1);
INSERT INTO `comment` (`id`, `title`, `body`, `flag_content`, `date_created`, `in_reply_to`, `active`, `user_event_id`) VALUES (2, 'second comment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, CURRENT_TIMESTAMP(), 1, 1, 1);
INSERT INTO `comment` (`id`, `title`, `body`, `flag_content`, `date_created`, `in_reply_to`, `active`, `user_event_id`) VALUES (3, 'third comment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, CURRENT_TIMESTAMP(), 2, 1, 1);

COMMIT;
