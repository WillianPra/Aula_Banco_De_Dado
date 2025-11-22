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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `ID_produto` INT NOT NULL AUTO_INCREMENT,
  `Nome_produto` TEXT NULL,
  `Descricao_produto` TEXT NULL,
  `Preco_produto` DECIMAL NULL,
  PRIMARY KEY (`ID_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mesa` (
  `ID_mesa` INT NOT NULL AUTO_INCREMENT,
  `capacidade` INT NULL,
  `localizacao` TEXT NULL,
  PRIMARY KEY (`ID_mesa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `ID_Cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `obeservacoes` TEXT NULL,
  PRIMARY KEY (`ID_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `ID_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(90) NULL,
  `cargo` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `ID_Pedido` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NULL,
  `total` DECIMAL NULL,
  `status` VARCHAR(45) NULL,
  `mesa_ID` INT NOT NULL,
  `Cliente_ID` INT NOT NULL,
  `funcionario_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Pedido`),
  INDEX `fk_Pedido_mesa_idx` (`mesa_ID` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_ID` ASC) VISIBLE,
  INDEX `fk_Pedido_funcionario1_idx` (`funcionario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_mesa`
    FOREIGN KEY (`mesa_ID`)
    REFERENCES `mydb`.`mesa` (`ID_mesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_ID`)
    REFERENCES `mydb`.`Cliente` (`ID_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_funcionario1`
    FOREIGN KEY (`funcionario_ID`)
    REFERENCES `mydb`.`funcionario` (`ID_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemPedido` (
  `ID_Pedido` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT NULL,
  `preco_unitario` DECIMAL NULL,
  `Sub_total` DECIMAL NULL,
  `Produto_ID` INT NOT NULL,
  `Pedido_ID` INT NOT NULL,
  PRIMARY KEY (`ID_Pedido`),
  INDEX `fk_ItemPedido_Produto1_idx` (`Produto_ID` ASC) VISIBLE,
  INDEX `fk_ItemPedido_Pedido1_idx` (`Pedido_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ItemPedido_Produto1`
    FOREIGN KEY (`Produto_ID`)
    REFERENCES `mydb`.`Produto` (`ID_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemPedido_Pedido1`
    FOREIGN KEY (`Pedido_ID`)
    REFERENCES `mydb`.`Pedido` (`ID_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caixa` (
  `ID_Caixa` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL,
  `valor_abertura` DECIMAL NULL,
  `valor_fechamento` DECIMAL NULL,
  `saldo_total` DECIMAL NULL,
  PRIMARY KEY (`ID_Caixa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pagamento` (
  `ID_pagamento` INT NOT NULL AUTO_INCREMENT,
  `forma_pagamento` VARCHAR(45) NULL,
  `data_hora` DATETIME NULL,
  `comprovante` VARCHAR(45) NULL,
  `Caixa_ID_Caixa` INT NOT NULL,
  `Pedido_ID` INT NOT NULL,
  `funcionario_ID` INT NOT NULL,
  PRIMARY KEY (`ID_pagamento`),
  INDEX `fk_pagamento_Caixa1_idx` (`Caixa_ID_Caixa` ASC) VISIBLE,
  INDEX `fk_pagamento_Pedido1_idx` (`Pedido_ID` ASC) VISIBLE,
  INDEX `fk_pagamento_funcionario1_idx` (`funcionario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_Caixa1`
    FOREIGN KEY (`Caixa_ID_Caixa`)
    REFERENCES `mydb`.`Caixa` (`ID_Caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_Pedido1`
    FOREIGN KEY (`Pedido_ID`)
    REFERENCES `mydb`.`Pedido` (`ID_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagamento_funcionario1`
    FOREIGN KEY (`funcionario_ID`)
    REFERENCES `mydb`.`funcionario` (`ID_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sangria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sangria` (
  `ID_sangria` INT NOT NULL,
  `valor` DECIMAL NULL,
  `motivo` TEXT NULL,
  `data_hora` DATETIME NULL,
  `Caixa_ID` INT NOT NULL,
  `funcionario_ID` INT NOT NULL,
  PRIMARY KEY (`ID_sangria`),
  INDEX `fk_sangria_Caixa1_idx` (`Caixa_ID` ASC) VISIBLE,
  INDEX `fk_sangria_funcionario1_idx` (`funcionario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_sangria_Caixa1`
    FOREIGN KEY (`Caixa_ID`)
    REFERENCES `mydb`.`Caixa` (`ID_Caixa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sangria_funcionario1`
    FOREIGN KEY (`funcionario_ID`)
    REFERENCES `mydb`.`funcionario` (`ID_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
