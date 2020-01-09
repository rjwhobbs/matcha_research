-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=‘TRADITIONAL,ALLOW_INVALID_DATES’;
-- -----------------------------------------------------
-- Schema matcha
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema matcha
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `matcha` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
USE `matcha` ;
-- -----------------------------------------------------
-- Table `matcha`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(200) NOT NULL,
  `last_name` VARCHAR(200) NOT NULL,
  `gender` INT NOT NULL,
  `biography` VARCHAR(500) NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `fame_rating` INT UNSIGNED NOT NULL,
  `latitude` VARCHAR(40) NOT NULL,
  `longitude` VARCHAR(40) NOT NULL,
  `last_seen` BIGINT(8) UNSIGNED NOT NULL,
  `age` INT NOT NULL,
  `reset_token` VARCHAR(200) NULL,
  `verify_token` VARCHAR(200) NULL,
  `verified` TINYINT NOT NULL,
  `profile_pic_path` VARCHAR(200) NULL,
  `sex_pref` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `reset_token_UNIQUE` (`reset_token` ASC),
  UNIQUE INDEX `verify_token_UNIQUE` (`verify_token` ASC),
  UNIQUE INDEX `profile_pic_path_UNIQUE` (`profile_pic_path` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tag` VARCHAR(200) NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `tags_id_constraint`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tags_username_constraint`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`pictures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`pictures` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `pic_path` VARCHAR(200) NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`viewers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`viewers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `viewer_id` INT NOT NULL,
  `viewer_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`likers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`likers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `liker_id` INT NOT NULL,
  `liker_username` VARCHAR(200) NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`fake_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`fake_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`blocked_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`blocked_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `blocked_id` INT NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  `blocked_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`notifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notification` VARCHAR(500) NOT NULL,
  `read` TINYINT NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `other_user_id` INT NOT NULL,
  `time_issued` BIGINT(8) UNSIGNED NOT NULL,
  `message` VARCHAR(10000) CHARACTER SET ‘utf8mb4’ COLLATE ‘utf8mb4_bin’ NOT NULL,
  `read` TINYINT NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `matcha`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matcha`.`friends` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  `username` VARCHAR(200) NOT NULL,
  `friend_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `matcha`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `matcha`.`users` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
