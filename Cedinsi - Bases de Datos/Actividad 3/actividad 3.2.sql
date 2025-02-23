-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema la_cerveceria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema la_cerveceria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `la_cerveceria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `la_cerveceria` ;

-- -----------------------------------------------------
-- Table `la_cerveceria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `detalles` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `la_cerveceria`.`cerveza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`cerveza` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `detalle` VARCHAR(45) NOT NULL,
  `id_categ` INT NOT NULL,
  PRIMARY KEY (`id`, `id_categ`),
  INDEX `id_categoria_idx` (`id_categ` ASC) VISIBLE,
  CONSTRAINT `id_categ`
    FOREIGN KEY (`id_categ`)
    REFERENCES `la_cerveceria`.`categorias` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `la_cerveceria`.`materiaprima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`materiaprima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `detalles` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `la_cerveceria`.`cerv_matprima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`cerv_matprima` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `unidad` INT NOT NULL,
  `id_cerv` INT NOT NULL,
  `id_matprim` INT NOT NULL,
  PRIMARY KEY (`id`, `id_cerv`, `id_matprim`),
  INDEX `id_cerv_idx` (`id_cerv` ASC) VISIBLE,
  INDEX `id_matprim_idx` (`id_matprim` ASC) VISIBLE,
  CONSTRAINT `id_cerv`
    FOREIGN KEY (`id_cerv`)
    REFERENCES `la_cerveceria`.`cerveza` (`id`),
  CONSTRAINT `id_matprim`
    FOREIGN KEY (`id_matprim`)
    REFERENCES `la_cerveceria`.`materiaprima` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `la_cerveceria`.`tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`tipos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `la_cerveceria`.`tipodecategorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_cerveceria`.`tipodecategorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`, `id_tipo`, `id_categoria`),
  INDEX `id_tipo_idx` (`id_tipo` ASC) VISIBLE,
  INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `la_cerveceria`.`categorias` (`id`),
  CONSTRAINT `id_tipo`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `la_cerveceria`.`tipos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
