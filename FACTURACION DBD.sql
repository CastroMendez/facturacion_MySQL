-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PROYECTODBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PROYECTODBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PROYECTODBD` DEFAULT CHARACTER SET utf8 ;
USE `PROYECTODBD` ;

-- -----------------------------------------------------
-- Table `PROYECTODBD`.`tipo_de_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`tipo_de_documento` (
  `id_tipo_documento` INT(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`ciudad` (
  `Codigo_ciudad` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_ciudad` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Codigo_ciudad`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`proveedor` (
  `No_documento` VARCHAR(20) NOT NULL,
  `cod_tipo_documento` INT(11) NOT NULL,
  `Nombre` VARCHAR(20) NOT NULL,
  `Apellido` VARCHAR(20) NOT NULL,
  `Nombre_comercial` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(20) NULL DEFAULT NULL,
  `cod_ciudad` INT(11) NOT NULL,
  `Telefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`No_documento`),
  INDEX `ref_prov_ciudad_idx` (`cod_ciudad` ASC),
  INDEX `proveedor_ibfk_1` (`cod_tipo_documento` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`tipo_articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`tipo_articulo` (
  `id_tipoarticulo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_articulo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_tipoarticulo`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`articulo` (
  `id_articulo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(30) NOT NULL,
  `precio_venta` INT(11) NOT NULL,
  `precio_costo` INT(11) NOT NULL,
  `stock` INT(11) NOT NULL,
  `cod_tipo_articulo` INT(11) NOT NULL,
  `cod_proveedor` VARCHAR(20) NOT NULL,
  `fecha_ingreso` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  INDEX `ref_tipo_articulo_idx` (`cod_tipo_articulo` ASC),
  INDEX `ref_prov_art_idx` (`cod_proveedor` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`cliente` (
  `Documento` VARCHAR(15) NOT NULL,
  `cod_tipo_documento` INT(11) NOT NULL,
  `Nombres` VARCHAR(30) NOT NULL,
  `Apellidos` VARCHAR(30) NOT NULL,
  `Direccion` VARCHAR(20) NULL DEFAULT NULL,
  `cod_ciudad` INT(11) NOT NULL,
  `Telefono` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Documento`),
  INDEX `cod_tipodocumento_idx` (`cod_tipo_documento` ASC),
  INDEX `ref_ciudad_idx` (`cod_ciudad` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`forma_de_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`forma_de_pago` (
  `id_formapago` INT(11) NOT NULL AUTO_INCREMENT,
  `Descripcion_formapago` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_formapago`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`factura` (
  `Nnm_factura` VARCHAR(20) NOT NULL,
  `cod_cliente` VARCHAR(15) NOT NULL,
  `Nombre_empleado` VARCHAR(30) NOT NULL,
  `Fecha_facturacion` VARCHAR(15) NOT NULL,
  `cod_formapago` INT(11) NOT NULL,
  `total_factura` DECIMAL(10,0) NULL DEFAULT NULL,
  `IVA` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`Nnm_factura`),
  INDEX `ref_cli_idx` (`Nnm_factura` ASC),
  INDEX `ref_formapago_idx` (`cod_formapago` ASC),
  INDEX `ref_cli` (`cod_cliente` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`detalle_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`detalle_factura` (
  `cod_factura` VARCHAR(20) NOT NULL,
  `cod_articulo` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `total` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`cod_factura`, `cod_articulo`),
  INDEX `ref_facturacion_idx` (`cod_factura` ASC),
  INDEX `ref_ar_fact_idx` (`cod_articulo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PROYECTODBD`.`devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTODBD`.`devolucion` (
  `cod_detallefactura` VARCHAR(20) NOT NULL,
  `cod_detallearticulo` INT(11) NOT NULL,
  `Motivo` VARCHAR(15) NOT NULL,
  `Fecha_devolucion` VARCHAR(10) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`cod_detallefactura`, `cod_detallearticulo`),
  INDEX `ref_detallefactu_idx` (`cod_detallefactura` ASC),
  INDEX `ref_deta_art_idx` (`cod_detallearticulo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
