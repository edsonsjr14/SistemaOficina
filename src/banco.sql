-- MySQL Script generated by MySQL Workbench
-- Sun Jun 25 23:16:47 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bdsgrpo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdsgrpo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdsgrpo` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
USE `bdsgrpo` ;

-- -----------------------------------------------------
-- Table `bdsgrpo`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `sexoCliente` VARCHAR(45) NOT NULL,
  `cpfCliente` VARCHAR(45) NOT NULL,
  `endCliente` VARCHAR(80) NOT NULL,
  `emailCliente` VARCHAR(45) NOT NULL,
  `telCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`funcionario` (
  `idFuncionario` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `sexoFuncionario` VARCHAR(45) NOT NULL,
  `cpfFuncionario` VARCHAR(45) NOT NULL,
  `endFuncionario` VARCHAR(45) NOT NULL,
  `emailFuncionario` VARCHAR(45) NOT NULL,
  `salFuncionario` DOUBLE NOT NULL,
  `setorFuncionario` VARCHAR(45) NOT NULL,
  `telFuncionario` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`orcamento` (
  `idOrcamento` INT(11) NOT NULL AUTO_INCREMENT,
  `codCliente` INT(11) NOT NULL,
  `codFuncionario` INT(11) NOT NULL,
  `valorOrcamento` DOUBLE NOT NULL,
  `dataCadastro` VARCHAR(10) NOT NULL,
  `descOrcamento` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idOrcamento`),
  INDEX `codCliente_idx` (`codCliente` ASC),
  INDEX `codFuncionario_idx` (`codFuncionario` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`produto` (
  `idProduto` INT(11) NOT NULL AUTO_INCREMENT,
  `valorCompraProduto` DOUBLE NOT NULL,
  `valorVendaProduto` DOUBLE NOT NULL,
  `qtdProduto` INT(11) NOT NULL,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `descProduto` VARCHAR(150) NOT NULL,
  `dataCadastro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`orcamento_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`orcamento_has_produto` (
  `orcamento_idOrcamento` INT(11) NOT NULL,
  `produto_idProduto` INT(11) NOT NULL,
  `idOrcamento_Produto` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idOrcamento_Produto`),
  INDEX `fk_orcamento_has_produto_produto1_idx` (`produto_idProduto` ASC),
  INDEX `fk_orcamento_has_produto_orcamento_idx` (`orcamento_idOrcamento` ASC),
  CONSTRAINT `fk_orcamento_has_produto_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `bdsgrpo`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`ordemdeservico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`ordemdeservico` (
  `idordemdeservico` INT(11) NOT NULL AUTO_INCREMENT,
  `codCliente` INT(11) NOT NULL,
  `codFuncionario` INT(11) NOT NULL,
  `valorOS` VARCHAR(45) NOT NULL,
  `dataCadastro` VARCHAR(45) NOT NULL,
  `descOS` VARCHAR(100) NULL DEFAULT NULL,
  `statusOS` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idordemdeservico`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bdsgrpo`.`ordemdeservico_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdsgrpo`.`ordemdeservico_has_produto` (
  `ordemdeservico_idordemdeservico` INT(11) NOT NULL,
  `produto_idProduto` INT(11) NOT NULL,
  `idOrdemdeservico_Produto` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idOrdemdeservico_Produto`),
  INDEX `fk_ordemdeservico_has_produto_produto1_idx` (`produto_idProduto` ASC),
  INDEX `fk_ordemdeservico_has_produto_ordemdeservico1_idx` (`ordemdeservico_idordemdeservico` ASC),
  CONSTRAINT `fk_ordemdeservico_has_produto_ordemdeservico1`
    FOREIGN KEY (`ordemdeservico_idordemdeservico`)
    REFERENCES `bdsgrpo`.`ordemdeservico` (`idordemdeservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordemdeservico_has_produto_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `bdsgrpo`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;