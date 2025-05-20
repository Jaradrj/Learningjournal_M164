-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehicle` ;

CREATE TABLE IF NOT EXISTS `vehicle` (
  `vehicle_id` INT NOT NULL AUTO_INCREMENT,
  `seats` INT NULL,
  PRIMARY KEY (`vehicle_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ride` ;

CREATE TABLE IF NOT EXISTS `ride` (
  `ride_id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_vehicle_id` INT NOT NULL,
  PRIMARY KEY (`ride_id`),
  INDEX `fk_ride_vehicle1_idx` (`vehicle_vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_ride_vehicle1`
    FOREIGN KEY (`vehicle_vehicle_id`)
    REFERENCES `vehicle` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` INT NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `driver` ;

CREATE TABLE IF NOT EXISTS `driver` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(45) NULL,
  `id_company` INT NOT NULL,
  PRIMARY KEY (`driver_id`),
  INDEX `fk_driver_company_idx` (`id_company` ASC) VISIBLE,
  CONSTRAINT `fk_driver_company`
    FOREIGN KEY (`id_company`)
    REFERENCES `company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stop` ;

CREATE TABLE IF NOT EXISTS `stop` (
  `stop_id` INT NOT NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `id_driver` INT NOT NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`stop_id`),
  INDEX `fk_stop_driver1_idx` (`id_driver` ASC) VISIBLE,
  UNIQUE INDEX `location_UNIQUE` (`location` ASC) VISIBLE,
  CONSTRAINT `fk_stop_driver1`
    FOREIGN KEY (`id_driver`)
    REFERENCES `driver` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dispatcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dispatcher` ;

CREATE TABLE IF NOT EXISTS `dispatcher` (
  `dispatcher_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `id_company` INT NOT NULL,
  PRIMARY KEY (`dispatcher_id`),
  INDEX `fk_dispatcher_company1_idx` (`id_company` ASC) VISIBLE,
  CONSTRAINT `fk_dispatcher_company1`
    FOREIGN KEY (`id_company`)
    REFERENCES `company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dispatcher_has_ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dispatcher_has_ride` ;

CREATE TABLE IF NOT EXISTS `dispatcher_has_ride` (
  `id_dispatcher` INT NOT NULL,
  `id_ride` INT NOT NULL,
  PRIMARY KEY (`id_dispatcher`, `id_ride`),
  INDEX `fk_dispatcher_has_ride_ride1_idx` (`id_ride` ASC) VISIBLE,
  INDEX `fk_dispatcher_has_ride_dispatcher1_idx` (`id_dispatcher` ASC) VISIBLE,
  CONSTRAINT `fk_dispatcher_has_ride_dispatcher1`
    FOREIGN KEY (`id_dispatcher`)
    REFERENCES `dispatcher` (`dispatcher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispatcher_has_ride_ride1`
    FOREIGN KEY (`id_ride`)
    REFERENCES `ride` (`ride_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stop_has_ride`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stop_has_ride` ;

CREATE TABLE IF NOT EXISTS `stop_has_ride` (
  `id_stop` INT NOT NULL,
  `id_ride` INT NOT NULL,
  PRIMARY KEY (`id_stop`, `id_ride`),
  INDEX `fk_stop_has_ride_ride1_idx` (`id_ride` ASC) VISIBLE,
  INDEX `fk_stop_has_ride_stop1_idx` (`id_stop` ASC) VISIBLE,
  CONSTRAINT `fk_stop_has_ride_stop1`
    FOREIGN KEY (`id_stop`)
    REFERENCES `stop` (`stop_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stop_has_ride_ride1`
    FOREIGN KEY (`id_ride`)
    REFERENCES `ride` (`ride_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
