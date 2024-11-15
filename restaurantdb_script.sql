-- MySQL Script generated by MySQL Workbench
-- Sat Sep 28 18:09:32 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurant_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant_db` DEFAULT CHARACTER SET utf8 ;
USE `restaurant_db` ;

-- -----------------------------------------------------
-- Table `restaurant_db`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NULL,
  `phone` TEXT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`, `address_id`),
  INDEX `fk_customer_address_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `restaurant_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `area_id` INT NOT NULL,
  PRIMARY KEY (`id`, `area_id`),
  INDEX `fk_role_area1_idx` (`area_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_area1`
    FOREIGN KEY (`area_id`)
    REFERENCES `restaurant_db`.`area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `role_id`),
  INDEX `fk_employee_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `restaurant_db`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`customer_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`customer_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `created_date` DATE NOT NULL,
  `status_id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`, `customer_id`, `employee_id`, `status_id`),
  INDEX `fk_customer_order_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_customer_order_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_customer_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `restaurant_db`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `restaurant_db`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `restaurant_db`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`restaurant_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`restaurant_table` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `customer_ID` INT NOT NULL,
  `restaurant_table_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `customer_ID`, `restaurant_table_id`, `status_id`),
  INDEX `fk_reservation_customer1_idx` (`customer_ID` ASC) VISIBLE,
  INDEX `fk_reservation_restaurant_table1_idx` (`restaurant_table_id` ASC) VISIBLE,
  INDEX `fk_reservation_status1_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_customer1`
    FOREIGN KEY (`customer_ID`)
    REFERENCES `restaurant_db`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_restaurant_table1`
    FOREIGN KEY (`restaurant_table_id`)
    REFERENCES `restaurant_db`.`restaurant_table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `restaurant_db`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `restaurant_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL DEFAULT 'No Category',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `stock` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`, `category_id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `restaurant_db`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file` BLOB NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employee_id`),
  INDEX `fk_report_employee1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_report_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `restaurant_db`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`, `address_id`),
  INDEX `fk_supplier_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `restaurant_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`material` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`supplier_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`supplier_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(10,2) NOT NULL,
  `created_date` DATE NOT NULL,
  `employee_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employee_id`, `supplier_id`, `status_id`),
  INDEX `fk_supplier_order_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_supplier_order_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `fk_supplier_order_status1_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_order_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `restaurant_db`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_order_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `restaurant_db`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_order_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `restaurant_db`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`product_has_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`product_has_material` (
  `product_id` INT,
  `material_id` INT,
  PRIMARY KEY (`product_id`, `material_id`),
  INDEX `fk_product_has_material_material1_idx` (`material_id` ASC) VISIBLE,
  INDEX `fk_product_has_material_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_material_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `restaurant_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_material_material1`
    FOREIGN KEY (`material_id`)
    REFERENCES `restaurant_db`.`material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`product_has_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`product_has_supplier` (
  `product_id` INT,
  `supplier_id` INT,
  PRIMARY KEY (`product_id`, `supplier_id`),
  INDEX `fk_product_has_supplier_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `fk_product_has_supplier_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_supplier_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `restaurant_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_supplier_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `restaurant_db`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`material_has_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`material_has_supplier` (
  `material_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`material_id`, `supplier_id`),
  INDEX `fk_material_has_supplier_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `fk_material_has_supplier_material1_idx` (`material_id` ASC) VISIBLE,
  CONSTRAINT `fk_material_has_supplier_material1`
    FOREIGN KEY (`material_id`)
    REFERENCES `restaurant_db`.`material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_has_supplier_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `restaurant_db`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`supplier_order_has_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`supplier_order_has_material` (
  `supplier_order_id` INT NOT NULL,
  `material_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`supplier_order_id`, `material_id`),
  INDEX `fk_supplier_order_has_material_material1_idx` (`material_id` ASC) VISIBLE,
  INDEX `fk_supplier_order_has_material_supplier_order1_idx` (`supplier_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_order_has_material_supplier_order1`
    FOREIGN KEY (`supplier_order_id`)
    REFERENCES `restaurant_db`.`supplier_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_order_has_material_material1`
    FOREIGN KEY (`material_id`)
    REFERENCES `restaurant_db`.`material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`customer_order_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`customer_order_has_product` (
  `customer_order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_order_has_product_customer_order1`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `restaurant_db`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `restaurant_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_db`.`supplier_order_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_db`.`supplier_order_has_product` (
  `supplier_order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`supplier_order_id`, `product_id`),
  INDEX `fk_supplier_order_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_supplier_order_has_product_supplier_order1_idx` (`supplier_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_order_has_product_supplier_order1`
    FOREIGN KEY (`supplier_order_id`)
    REFERENCES `restaurant_db`.`supplier_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supplier_order_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `restaurant_db`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
