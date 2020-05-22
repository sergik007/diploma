-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rent_ap
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rent_ap` ;

-- -----------------------------------------------------
-- Schema rent_ap
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rent_ap` DEFAULT CHARACTER SET utf8 ;
USE `rent_ap` ;

-- -----------------------------------------------------
-- Table `rent_ap`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`area` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`area` (
  `id_area` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_area`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`user` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`user` (
  `id_user` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enabled` TINYINT(1) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `username_unq_idx` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`status` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`status` (
  `id_status` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_status`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`flat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`flat` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`flat` (
  `id_flat` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount_room` INT(11) NOT NULL,
  `average_mark` FLOAT NOT NULL,
  `month_price` DOUBLE NOT NULL,
  `upload_date` DATE NOT NULL,
  `id_status` BIGINT(20) UNSIGNED NOT NULL,
  `id_user` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_flat`),
  INDEX `status_has_flat_idx` (`id_status` ASC),
  INDEX `user_has_flat_idx` (`id_user` ASC),
  CONSTRAINT `FKhrfjrr3bwlmlfu9e397jexk0u`
    FOREIGN KEY (`id_user`)
    REFERENCES `rent_ap`.`user` (`id_user`),
  CONSTRAINT `fk_status_has_flat`
    FOREIGN KEY (`id_status`)
    REFERENCES `rent_ap`.`status` (`id_status`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`addresses` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`addresses` (
  `id_address` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flat_number` INT(11) NULL DEFAULT NULL,
  `house_number` INT(11) NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `id_area` BIGINT(20) UNSIGNED NOT NULL,
  `id_flat` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_address`),
  INDEX `flat_has_address_idx` (`id_flat` ASC),
  INDEX `area_has_address_idx` (`id_area` ASC),
  CONSTRAINT `fk_area_has_address`
    FOREIGN KEY (`id_area`)
    REFERENCES `rent_ap`.`area` (`id_area`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_flat_has_address`
    FOREIGN KEY (`id_flat`)
    REFERENCES `rent_ap`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`authority` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`authority` (
  `id_authority` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `authority` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_authority`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`image` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`image` (
  `id_image` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `id_flat` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_image`),
  INDEX `flat_has_image_idx` (`id_flat` ASC),
  CONSTRAINT `fk_flat_has_image`
    FOREIGN KEY (`id_flat`)
    REFERENCES `rent_ap`.`flat` (`id_flat`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`message` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`message` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `hash` INT(11) NOT NULL,
  `time` TIME NOT NULL,
  `username_from` VARCHAR(255) NOT NULL,
  `username_to` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `hash_idx` (`hash` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`subway`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`subway` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`subway` (
  `id_subway` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_subway`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`subway_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`subway_address` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`subway_address` (
  `id_address` BIGINT(20) UNSIGNED NOT NULL,
  `id_subway` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_address`, `id_subway`),
  INDEX `subway_has_address_idx` (`id_subway` ASC),
  INDEX `address_has_subway_idx` (`id_address` ASC),
  CONSTRAINT `fk_address_has_subway`
    FOREIGN KEY (`id_address`)
    REFERENCES `rent_ap`.`addresses` (`id_address`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_subway_has_address`
    FOREIGN KEY (`id_subway`)
    REFERENCES `rent_ap`.`subway` (`id_subway`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap`.`user_authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap`.`user_authority` ;

CREATE TABLE IF NOT EXISTS `rent_ap`.`user_authority` (
  `id_user` BIGINT(20) UNSIGNED NOT NULL,
  `id_authority` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_user`, `id_authority`),
  INDEX `authority_has_user_idx` (`id_authority` ASC),
  INDEX `user_has_authority_idx` (`id_user` ASC),
  CONSTRAINT `fk_authority_has_user`
    FOREIGN KEY (`id_authority`)
    REFERENCES `rent_ap`.`authority` (`id_authority`),
  CONSTRAINT `fk_user_has_authority`
    FOREIGN KEY (`id_user`)
    REFERENCES `rent_ap`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
