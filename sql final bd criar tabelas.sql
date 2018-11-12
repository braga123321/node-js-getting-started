-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema webitclo_B405
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema webitclo_B405
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webitclo_B405` DEFAULT CHARACTER SET utf8 ;
USE `webitclo_B405` ;

-- -----------------------------------------------------
-- Table `webitclo_B405`.`Tipos de Utilizadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Tipos de Utilizadores` (
  `Cod_Utilizador` INT NOT NULL,
  `Tipo de Utilizador` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Cod_Utilizador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Utilizador` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Data de nascimento` DATE NOT NULL,
  `Morada` VARCHAR(100) NOT NULL,
  `NIF` INT NOT NULL,
  `Cartão de Cidadão` INT NOT NULL,
  `Tipos de Utilizadores_Cod_Utilizador` INT NOT NULL,
  PRIMARY KEY (`ID`),
  
  CONSTRAINT `fkTipo`
    FOREIGN KEY (`Tipos de Utilizadores_Cod_Utilizador`)
    REFERENCES `webitclo_B405`.`Tipos de Utilizadores` (`Cod_Utilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Mensagem Privada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Mensagem Privada` (
  `ID_MP` INT NOT NULL,
  `Texto_MP` VARCHAR(100) NOT NULL,
  `ID_Envio` INT NOT NULL,
  `ID_Recebe` INT NOT NULL,
  PRIMARY KEY (`ID_MP`),
  
  CONSTRAINT `fk_Mensagem Privada_Utilizador1`
    FOREIGN KEY (`ID_Envio`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensagem Privada_Utilizador2`
    FOREIGN KEY (`ID_Recebe`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Tipos de Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Tipos de Eventos` (
  `ID_Evento` INT NOT NULL,
  `Tipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Evento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Eventos` (
  `ID_Evento` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `Descricao` VARCHAR(100) NOT NULL,
  `Tipos de Eventos_ID_Evento` INT NOT NULL,
  PRIMARY KEY (`ID_Evento`),
  
  CONSTRAINT `fk_Eventos_Tipos de Eventos1`
    FOREIGN KEY (`Tipos de Eventos_ID_Evento`)
    REFERENCES `webitclo_B405`.`Tipos de Eventos` (`ID_Evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Participação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Participação` (
  `ID_Participação` INT NOT NULL,
  `Utilizador_ID` INT NOT NULL,
  `Eventos_ID_Evento` INT NOT NULL,
  PRIMARY KEY (`ID_Participação`),
  
  CONSTRAINT `fk_Participação_Utilizador1`
    FOREIGN KEY (`Utilizador_ID`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participação_Eventos1`
    FOREIGN KEY (`Eventos_ID_Evento`)
    REFERENCES `webitclo_B405`.`Eventos` (`ID_Evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Tópicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Tópicos` (
  `ID_Tópico` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Tópico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Mensagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Mensagem` (
  `ID_Mensagem` INT NOT NULL,
  `Texto` VARCHAR(100) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` INT NOT NULL,
  `Tópicos_ID_Tópico` INT NOT NULL,
  `Utilizador_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Mensagem`),
  
  CONSTRAINT `fk_Mensagem_Tópicos1`
    FOREIGN KEY (`Tópicos_ID_Tópico`)
    REFERENCES `webitclo_B405`.`Tópicos` (`ID_Tópico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensagem_Utilizador1`
    FOREIGN KEY (`Utilizador_ID`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Tipos de Rubricas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Tipos de Rubricas` (
  `ID transferencia` INT NOT NULL,
  `Tipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID transferencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Contabilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Contabilidade` (
  `Num_Transferencia` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Valor` VARCHAR(100) NOT NULL,
  `Tipos de Transefrência_ID transferencia` INT NOT NULL,
  `Utilizador_ID` INT NOT NULL,
  PRIMARY KEY (`Num_Transferencia`),
  
  CONSTRAINT `fk_Transferências_Tipos de Transefrência1`
    FOREIGN KEY (`Tipos de Transefrência_ID transferencia`)
    REFERENCES `webitclo_B405`.`Tipos de Rubricas` (`ID transferencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transferências_Utilizador1`
    FOREIGN KEY (`Utilizador_ID`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webitclo_B405`.`Fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webitclo_B405`.`Fotos` (
  `ID_Foto` INT NOT NULL,
  `Foto` BIT NULL,
  `ID_Evento` INT NOT NULL,
  `Utilizador_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Foto`),
  
  CONSTRAINT `fk_Fotos_Eventos1`
    FOREIGN KEY (`ID_Evento`)
    REFERENCES `webitclo_B405`.`Eventos` (`ID_Evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fotos_Utilizador1`
    FOREIGN KEY (`Utilizador_ID`)
    REFERENCES `webitclo_B405`.`Utilizador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
