
-- -----------------------------------------------------
-- Table `creaditcards`
-- -----------------------------------------------------
CREATE TABLE IF NOT exists`creditcards` (
  `id` VARCHAR(20) NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `expiration` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `ccId` VARCHAR(20) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ccIdC_idx` (`ccId` ASC),
  CONSTRAINT `ccIdC`
    FOREIGN KEY (`ccId`)
    REFERENCES `creditcards` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies` (
  `id` VARCHAR(10) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `year` INT NOT NULL,
  `director` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `genres_in_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `genres_in_movies` (
  `genreId` INT NOT NULL,
  `movieId` VARCHAR(10) NOT NULL,
  INDEX `genreID_idx` (`genreId` ASC),
  INDEX `movieId1_idx` (`movieId` ASC),
  CONSTRAINT `genreId2`
    FOREIGN KEY (`genreId`)
    REFERENCES `genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movieId1`
    FOREIGN KEY (`movieId`)
    REFERENCES `movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratings` (
  `movieID` VARCHAR(10) NOT NULL,
  `rating` FLOAT NOT NULL,
  `numVotes` INT NOT NULL,
  INDEX `movieIDra_idx` (`movieID` ASC),
  CONSTRAINT `movieIDra`
    FOREIGN KEY (`movieID`)
    REFERENCES `movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customerId` INT NOT NULL,
  `movieId` VARCHAR(10) NOT NULL,
  `saleData` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `movieIDv_idx` (`movieId` ASC),
  CONSTRAINT `customerIds`
    FOREIGN KEY (`customerId`)
    REFERENCES `customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movieIDv`
    FOREIGN KEY (`movieId`)
    REFERENCES `movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stars` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `birthYear` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stars_in_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stars_in_movies` (
  `starID` VARCHAR(10) NOT NULL,
  `movieId` VARCHAR(10) NOT NULL,
  INDEX `movieId_idx` (`movieId` ASC),
  INDEX `starID_idx` (`starId` ASC),
  CONSTRAINT `movieIdsa`
    FOREIGN KEY (`movieId`)
    REFERENCES `movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `starIDasd`
    FOREIGN KEY (`starId`)
    REFERENCES `stars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

