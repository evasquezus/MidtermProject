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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `phone` INT NULL,
  `image_url` VARCHAR(500) NULL,
  `active` TINYINT NULL,
  `date_created` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  `date_created` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT(5000) NOT NULL,
  `event_type_id` INT NOT NULL,
  `start_time` DATETIME NOT NULL,
  `finish_time` DATETIME NOT NULL,
  `image_url` VARCHAR(200) NULL,
  `address_id` INT NULL,
  `open` TINYINT NULL,
  `max_size` INT NULL,
  `rideshare` TINYINT NULL,
  `owner_id` INT NULL,
  `date_created` DATETIME NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_subject` ;

CREATE TABLE IF NOT EXISTS `event_subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(200) NULL,
  `img_url` VARCHAR(200) NULL,
  `user_id` INT NULL,
  `date_created` DATETIME NOT NULL,
  `flag_content` TINYINT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_event` ;

CREATE TABLE IF NOT EXISTS `user_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `date_created` DATETIME NULL,
  `event_rating` INT NULL,
  `flag_content` TINYINT NULL,
  `active` TINYINT NULL,
  `host_rating` INT NULL,
  `event_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `body` TEXT(2000) NULL,
  `flag_content` TINYINT NULL,
  `date_created` DATETIME NULL,
  `in_reply_to` INT NULL,
  `active` TINYINT NULL,
  `user_event_id` INT NULL,
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

SET SQL_MODE = '';
DROP USER IF EXISTS unha@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'unha'@'localhost' IDENTIFIED BY 'unha';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'unha'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
