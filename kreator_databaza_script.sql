-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema kreator_centralna_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kreator_centralna_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kreator_centralna_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `kreator_centralna_db` ;

-- -----------------------------------------------------
-- Table `kreator_centralna_db`.`Dodavatelia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kreator_centralna_db`.`Dodavatelia` (
  `id_Dodavatel` INT NOT NULL AUTO_INCREMENT,
  `adresa` VARCHAR(255) NULL,
  `telefon` INT NULL,
  `mail` VARCHAR(255) NULL,
  UNIQUE INDEX `id_Dodavatel_UNIQUE` (`id_Dodavatel` ASC) VISIBLE,
  PRIMARY KEY (`id_Dodavatel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kreator_centralna_db`.`Klienti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kreator_centralna_db`.`Klienti` (
  `id_klienta` INT NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(45) NULL,
  `telefon` INT NULL,
  `id_Ponuka` INT NULL,
  PRIMARY KEY (`id_klienta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kreator_centralna_db`.`Ponuka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kreator_centralna_db`.`Ponuka` (
  `id_Ponuka` INT NOT NULL AUTO_INCREMENT,
  `datum` DATE NOT NULL,
  `klient` VARCHAR(45) NULL,
  `kampan` VARCHAR(45) NULL,
  `cena` FLOAT NOT NULL,
  `plochy` JSON NOT NULL,
  `id_klienta` INT NULL,
  `odsuhlasenie` VARCHAR(3) BINARY NULL,
  UNIQUE INDEX `id_Ponuka_UNIQUE` (`id_Ponuka` ASC) VISIBLE,
  PRIMARY KEY (`id_Ponuka`),
  UNIQUE INDEX `id_klienta_UNIQUE` (`id_klienta` ASC) VISIBLE,
  CONSTRAINT `id_klienta`
    FOREIGN KEY (`id_klienta`)
    REFERENCES `kreator_centralna_db`.`Klienti` (`id_klienta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kreator_centralna_db`.`Centralny_zoznam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kreator_centralna_db`.`Centralny_zoznam` (
  `idPlocha` INT NOT NULL AUTO_INCREMENT,
  `Dodavatel` VARCHAR(45) NOT NULL,
  `Typ_plochy` VARCHAR(45) NOT NULL,
  `Region` VARCHAR(45) NOT NULL,
  `Rozmer_X_sirka` INT NOT NULL,
  `Rozmer_Y_vyska` INT NOT NULL,
  `Plocha_XY` FLOAT NOT NULL,
  `Gps_lat` FLOAT NOT NULL,
  `Gps_log` FLOAT NOT NULL,
  `id_Dodavatel` INT NULL,
  `id_Ponuka` INT NULL,
  PRIMARY KEY (`idPlocha`),
  UNIQUE INDEX `idCentralny_zoznam_UNIQUE` (`idPlocha` ASC) VISIBLE,
  UNIQUE INDEX `Dodavatel_UNIQUE` (`Dodavatel` ASC) VISIBLE,
  INDEX `id_Dodavatel_idx` (`id_Dodavatel` ASC) VISIBLE,
  INDEX `id_Ponuka_idx` (`id_Ponuka` ASC) VISIBLE,
  CONSTRAINT `id_Dodavatel`
    FOREIGN KEY (`id_Dodavatel`)
    REFERENCES `kreator_centralna_db`.`Dodavatelia` (`id_Dodavatel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Ponuka`
    FOREIGN KEY (`id_Ponuka`)
    REFERENCES `kreator_centralna_db`.`Ponuka` (`id_Ponuka`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
