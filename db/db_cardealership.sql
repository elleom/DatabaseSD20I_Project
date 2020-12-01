-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_dealership
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_dealership
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_dealership` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_dealership` ;

-- -----------------------------------------------------
-- Table `car_dealership`.`audit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`audit` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  `date` DATE NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`payment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`payment_type` (
  `ID` INT NOT NULL,
  `type` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`location` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `postal_code` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `postalCode` (`postal_code` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `rating` INT NULL DEFAULT NULL,
  `password` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `location_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `user_name` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_users_location1_idx` (`location_ID` ASC) VISIBLE,
  CONSTRAINT `lives`
    FOREIGN KEY (`location_ID`)
    REFERENCES `car_dealership`.`location` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`make`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`make` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `name` (`code` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 72
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`model` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(125) NOT NULL,
  `code` VARCHAR(125) NOT NULL,
  `make_id` INT NOT NULL,
  PRIMARY KEY (`ID`, `make_id`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `name` (`name` ASC) VISIBLE,
  INDEX `build` (`make_id` ASC) VISIBLE,
  CONSTRAINT `build`
    FOREIGN KEY (`make_id`)
    REFERENCES `car_dealership`.`make` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 1315
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`vehicle` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `year` INT NOT NULL,
  `colour` VARCHAR(15) NOT NULL,
  `fuel_type` VARCHAR(1) NOT NULL,
  `Kms` INT NOT NULL,
  `hp` INT NOT NULL,
  `value` FLOAT NOT NULL,
  `available` TINYINT(1) NULL DEFAULT true,
  `location_id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `model_ID` INT NOT NULL,
  `orderID` INT NULL DEFAULT NULL,
  `make_ID` INT NOT NULL,
  `car_image` VARCHAR(255) NOT NULL DEFAULT '/images/no-image-available.jpg',
  PRIMARY KEY (`ID`, `model_ID`, `make_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_vehicle_location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_vehicle_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_vehicle_model1_idx` (`model_ID` ASC) VISIBLE,
  INDEX `fk_vehicle_orders1_idx` (`orderID` ASC) VISIBLE,
  INDEX `fk_vehicle_make1_idx` (`make_ID` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `car_dealership`.`location` (`ID`),
  CONSTRAINT `fk_vehicle_make1`
    FOREIGN KEY (`make_ID`)
    REFERENCES `car_dealership`.`make` (`ID`),
  CONSTRAINT `fk_vehicle_model1`
    FOREIGN KEY (`model_ID`)
    REFERENCES `car_dealership`.`model` (`ID`),
  CONSTRAINT `fk_vehicle_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `car_dealership`.`users` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `value` INT NOT NULL,
  `buyer_id` INT NOT NULL,
  `seller_id` INT NOT NULL,
  `vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `vehicle_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_orders_users1_idx` (`buyer_id` ASC) VISIBLE,
  INDEX `fk_orders_users2_idx` (`seller_id` ASC) VISIBLE,
  INDEX `fk_orders_vehicle1_idx` (`vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `car_dealership`.`users` (`ID`),
  CONSTRAINT `fk_orders_users2`
    FOREIGN KEY (`seller_id`)
    REFERENCES `car_dealership`.`users` (`ID`),
  CONSTRAINT `fk_orders_vehicle1`
    FOREIGN KEY (`vehicle_ID`)
    REFERENCES `car_dealership`.`vehicle` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`invoice` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `amount` INT NOT NULL,
  `order_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `payment_type_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `order_id`, `user_id`, `payment_type_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `generates` (`order_id` ASC) VISIBLE,
  INDEX `fk_invoice_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_invoice_payment_type1_idx` (`payment_type_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_payment_type1`
    FOREIGN KEY (`payment_type_ID`)
    REFERENCES `car_dealership`.`payment_type` (`ID`),
  CONSTRAINT `fk_invoice_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `car_dealership`.`users` (`ID`),
  CONSTRAINT `generates`
    FOREIGN KEY (`order_id`)
    REFERENCES `car_dealership`.`orders` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`users_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`users_orders` (
  `UsersID` INT NOT NULL,
  `ordersID` INT NOT NULL,
  PRIMARY KEY (`UsersID`, `ordersID`),
  INDEX `FKUsers_orde271643` (`ordersID` ASC) VISIBLE,
  CONSTRAINT `FKUsers_orde271643`
    FOREIGN KEY (`ordersID`)
    REFERENCES `car_dealership`.`orders` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `orders`
    FOREIGN KEY (`UsersID`)
    REFERENCES `car_dealership`.`users` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`users_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`users_users` (
  `usersID` INT NOT NULL,
  `usersID2` INT NOT NULL,
  PRIMARY KEY (`usersID`, `usersID2`),
  INDEX `FKusers_user471886` (`usersID2` ASC) VISIBLE,
  CONSTRAINT `FKusers_user471886`
    FOREIGN KEY (`usersID2`)
    REFERENCES `car_dealership`.`users` (`ID`),
  CONSTRAINT `rates`
    FOREIGN KEY (`usersID`)
    REFERENCES `car_dealership`.`users` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_dealership`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`users_roles` (
  `users_ID` INT NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`users_ID`, `roles_id`),
  INDEX `fk_users_has_roles_roles1_idx` (`roles_id` ASC) VISIBLE,
  INDEX `fk_users_has_roles_users1_idx` (`users_ID` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_roles_users1`
    FOREIGN KEY (`users_ID`)
    REFERENCES `car_dealership`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `car_dealership`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `car_dealership` ;

-- -----------------------------------------------------
-- Placeholder table for view `car_dealership`.`carsavailable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`carsavailable` (`Build Year` INT, `Kms` INT, `DKK` INT, `available` INT, `colour` INT, `Make` INT, `Model` INT, `Seller` INT);

-- -----------------------------------------------------
-- Placeholder table for view `car_dealership`.`carslisted`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`carslisted` (`Build Year` INT, `Kms` INT, `DKK` INT, `available` INT, `colour` INT, `Make` INT, `Model` INT, `Seller` INT);

-- -----------------------------------------------------
-- Placeholder table for view `car_dealership`.`carsnotavailable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_dealership`.`carsnotavailable` (`Build Year` INT, `Kms` INT, `DKK` INT, `available` INT, `colour` INT, `Make` INT, `Model` INT, `Seller` INT);

-- -----------------------------------------------------
-- View `car_dealership`.`carsavailable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_dealership`.`carsavailable`;
USE `car_dealership`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_dealership`.`carsavailable` AS select `carslisted`.`Build Year` AS `Build Year`,`carslisted`.`Kms` AS `Kms`,`carslisted`.`DKK` AS `DKK`,`carslisted`.`available` AS `available`,`carslisted`.`colour` AS `colour`,`carslisted`.`Make` AS `Make`,`carslisted`.`Model` AS `Model`,`carslisted`.`Seller` AS `Seller` from `car_dealership`.`carslisted` where (`carslisted`.`available` = 1);

-- -----------------------------------------------------
-- View `car_dealership`.`carslisted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_dealership`.`carslisted`;
USE `car_dealership`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_dealership`.`carslisted` AS select `car_dealership`.`vehicle`.`year` AS `Build Year`,`car_dealership`.`vehicle`.`Kms` AS `Kms`,`car_dealership`.`vehicle`.`value` AS `DKK`,`car_dealership`.`vehicle`.`available` AS `available`,`car_dealership`.`vehicle`.`colour` AS `colour`,`m2`.`name` AS `Make`,`m`.`name` AS `Model`,`u`.`user_name` AS `Seller` from ((((`car_dealership`.`vehicle` join `car_dealership`.`location` `l` on((`l`.`ID` = `car_dealership`.`vehicle`.`location_id`))) join `car_dealership`.`model` `m` on((`m`.`ID` = `car_dealership`.`vehicle`.`model_ID`))) join `car_dealership`.`users` `u` on((`u`.`ID` = `car_dealership`.`vehicle`.`user_id`))) join `car_dealership`.`make` `m2` on((`m2`.`ID` = `m`.`make_id`)));

-- -----------------------------------------------------
-- View `car_dealership`.`carsnotavailable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_dealership`.`carsnotavailable`;
USE `car_dealership`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_dealership`.`carsnotavailable` AS select `carslisted`.`Build Year` AS `Build Year`,`carslisted`.`Kms` AS `Kms`,`carslisted`.`DKK` AS `DKK`,`carslisted`.`available` AS `available`,`carslisted`.`colour` AS `colour`,`carslisted`.`Make` AS `Make`,`carslisted`.`Model` AS `Model`,`carslisted`.`Seller` AS `Seller` from `car_dealership`.`carslisted` where (`carslisted`.`available` = 1);
USE `car_dealership`;

DELIMITER $$
USE `car_dealership`$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `car_dealership`.`makeUnavailable`
AFTER INSERT ON `car_dealership`.`invoice`
FOR EACH ROW
update vehicle

        set orderID = (select ID from orders where orders.ID = (select max(orders.ID) from orders)),

            available = false

       where vehicle.ID = (select vehicle_ID from orders where LAST_INSERT_ID(orders.ID))$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
