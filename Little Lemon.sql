-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema test123
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `booking_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  `table_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`booking_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `cost` DECIMAL NULL,
  `order_delivery_status_id` VARCHAR(45) NULL,
  `booking_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `booking_id_fk_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`Bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `menu_id` INT NOT NULL,
  `cuisines` INT NULL,
  `starters` VARCHAR(45) NULL,
  `courses` VARCHAR(45) NULL,
  `drinks` VARCHAR(45) NULL,
  `desserts` VARCHAR(45) NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order delivery status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order delivery status` (
  `order_delivery_status_id` VARCHAR(45) NOT NULL,
  `delivery_date` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`order_delivery_status_id`),
  INDEX `order_id_fk_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer details` (
  `customer_id` VARCHAR(45) NOT NULL,
  `customer_names` INT NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `booking_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_Customer details_Bookings1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer details_Bookings1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`Bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff information` (
  `staff_id` VARCHAR(45) NOT NULL,
  `role` INT NOT NULL,
  `salary` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
