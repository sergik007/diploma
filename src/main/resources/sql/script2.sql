-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rent_ap2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rent_ap2` ;

-- -----------------------------------------------------
-- Schema rent_ap2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rent_ap2` DEFAULT CHARACTER SET utf8 ;
USE `rent_ap2` ;

-- -----------------------------------------------------
-- Table `rent_ap2`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`area` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`area` (
  `id_area` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_area`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`flat_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`flat_status` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`flat_status` (
  `id_flat_status` BIGINT(20) UNSIGNED NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_flat_status`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`flat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`flat` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`flat` (
  `id_flat` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount_room` INT(11) NOT NULL,
  `average_mark` FLOAT NOT NULL,
  `month_price` DOUBLE NOT NULL,
  `upload_date` DATE NOT NULL,
  `id_flat_status` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_flat`),
  INDEX `status_has_flat_idx` (`id_flat_status` ASC),
  CONSTRAINT `fk_status_flat_has_flat`
    FOREIGN KEY (`id_flat_status`)
    REFERENCES `rent_ap2`.`flat_status` (`id_flat_status`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`address` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`address` (
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
    REFERENCES `rent_ap2`.`area` (`id_area`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_flat_has_address`
    FOREIGN KEY (`id_flat`)
    REFERENCES `rent_ap2`.`flat` (`id_flat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`authority` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`authority` (
  `id_authority` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `authority` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_authority`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`image` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`image` (
  `id_image` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(255) NOT NULL,
  `id_flat` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_image`),
  INDEX `flat_has_image_idx` (`id_flat` ASC),
  CONSTRAINT `fk_flat_has_image`
    FOREIGN KEY (`id_flat`)
    REFERENCES `rent_ap2`.`flat` (`id_flat`))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`message` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`message` (
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
-- Table `rent_ap2`.`order_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`order_type` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`order_type` (
  `id_order_type` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_order_type`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`order_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`order_status` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`order_status` (
  `id_order_status` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_order_status`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`user` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`user` (
  `id_user` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enabled` TINYINT(1) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE INDEX `username_unq_idx` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`order` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`order` (
  `id_order` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` BIGINT(20) UNSIGNED NOT NULL,
  `id_flat` BIGINT(20) UNSIGNED NOT NULL,
  `id_order_status` BIGINT(20) UNSIGNED NOT NULL,
  `id_order_type` BIGINT(20) UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `user_has_order` (`id_user` ASC),
  INDEX `flat_has_order` (`id_flat` ASC),
  INDEX `order_status_has_order` (`id_order_status` ASC),
  INDEX `order_type_has_order` (`id_order_type` ASC),
  CONSTRAINT `order_has_flat`
    FOREIGN KEY (`id_flat`)
    REFERENCES `rent_ap2`.`flat` (`id_flat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_type_has_flats`
    FOREIGN KEY (`id_order_type`)
    REFERENCES `rent_ap2`.`order_type` (`id_order_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orser_status_has_flats`
    FOREIGN KEY (`id_order_status`)
    REFERENCES `rent_ap2`.`order_status` (`id_order_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_has_orders`
    FOREIGN KEY (`id_user`)
    REFERENCES `rent_ap2`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`subway`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`subway` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`subway` (
  `id_subway` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_subway`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`subway_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`subway_address` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`subway_address` (
  `id_address` BIGINT(20) UNSIGNED NOT NULL,
  `id_subway` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_address`, `id_subway`),
  INDEX `subway_has_address_idx` (`id_subway` ASC),
  INDEX `address_has_subway_idx` (`id_address` ASC),
  CONSTRAINT `fk_address_has_subway`
    FOREIGN KEY (`id_address`)
    REFERENCES `rent_ap2`.`address` (`id_address`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_subway_has_address`
    FOREIGN KEY (`id_subway`)
    REFERENCES `rent_ap2`.`subway` (`id_subway`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rent_ap2`.`user_authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent_ap2`.`user_authority` ;

CREATE TABLE IF NOT EXISTS `rent_ap2`.`user_authority` (
  `id_user` BIGINT(20) UNSIGNED NOT NULL,
  `id_authority` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_user`, `id_authority`),
  INDEX `authority_has_user_idx` (`id_authority` ASC),
  INDEX `user_has_authority_idx` (`id_user` ASC),
  CONSTRAINT `fk_authority_has_user`
    FOREIGN KEY (`id_authority`)
    REFERENCES `rent_ap2`.`authority` (`id_authority`),
  CONSTRAINT `fk_user_has_authority`
    FOREIGN KEY (`id_user`)
    REFERENCES `rent_ap2`.`user` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
