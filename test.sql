PRAGMA FOREIGN_KEY_CHECKS = OFF;
DROP TABLE IF EXISTS `AreaUnit`;
DROP TABLE IF EXISTS `EstateType`;
DROP TABLE IF EXISTS `Currency`;
DROP TABLE IF EXISTS `Level`;
DROP TABLE IF EXISTS `Estate`;
DROP TABLE IF EXISTS `Adress`;
DROP TABLE IF EXISTS `Sales`;
DROP TABLE IF EXISTS `Event`;
PRAGMA FOREIGN_KEY_CHECKS = ON;


CREATE TABLE `AreaUnit` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);

CREATE TABLE `EstateType` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);

CREATE TABLE `Currency` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(3) NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);

CREATE TABLE `Level` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);

CREATE TABLE `Estate` (
    `id` INTEGER NOT NULL,
    `yearBuillt` DATE(4),
    `description` VARCHAR NOT NULL,
    `livingArea` INTEGER(4) NOT NULL,
    `livingAreaValue` INTEGER(4) NOT NULL,
    `bathrooms` INTEGER NOT NULL,
    `bedrooms` INTEGER NOT NULL,
    `buildingArea` INTEGER NOT NULL,
    `parking` BOOLEAN NOT NULL,
    `garageSpaces` INTEGER NOT NULL,
    `hasGarage` BOOLEAN NOT NULL,
    `pool` BOOLEAN NOT NULL,
    `spa` BOOLEAN NOT NULL,
    `isNewConstruction` BOOLEAN NOT NULL,
    `hasPetsAllowed` BOOLEAN NOT NULL,
    `areaUnitId` INTEGER NOT NULL,
    `adressId` INTEGER NOT NULL,
    `levelId` INTEGER,
    `estateTypeId` INTEGER NOT NULL,
    `salesId` INTEGER NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`),
	FOREIGN KEY (`estateTypeId`) REFERENCES `EstateType`(`id`),
	FOREIGN KEY (`levelId`) REFERENCES `Level`(`id`),
	FOREIGN KEY (`areaUnitId`) REFERENCES `AreaUnit`(`id`),
	FOREIGN KEY (`adressId`) REFERENCES `Adress`(`id`),
	FOREIGN KEY (`salesId`) REFERENCES `Sales`(`id`),
	FOREIGN KEY (`currency_id`) REFERENCES `Currency`(`id`)
);

CREATE TABLE `Adress` (
    `id` INTERGER NOT NULL,
    `streetAdress` VARCHAR(128) NOT NULL,
    `zipcode` INTEGER(5) NOT NULL,
    `city` VARCHAR(128) NOT NULL,
    `state` VARCHAR(2) NOT NULL,
    `county` VARCHAR(128) NOT NULL,
    `country` VARCHAR(3) NOT NULL,
    `longitude` FLOAT NOT NULL,
    `latitude` FLOAT NOT NULL,
    `hasBadGoecode` BOOLEAN NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);

CREATE TABLE `Sales` (
    `id` INTEGER NOT NULL,
    `displayedId` VARCHAR(64) NOT NULL,
    `datePostedString` DATE NOT NULL,
    `is_bankOwned` BOOLEAN NOT NULL,
    `is_forAction` BOOLEAN NOT NULL,
    `price` INTEGER NOT NULL,
    `pricePerSquareFoot` INTEGER NOT NULL,
    `eventId` INTEGER NOT NULL,
    `currencyId` INTEGER NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`, `displayedId`),
	FOREIGN KEY (`eventId`) REFERENCES `Event`(`id`),
	FOREIGN KEY (`currencyId`) REFERENCES `Currency`(`id`)
);

CREATE TABLE `Event` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR NOT NULL,
    PRIMARY KEY (`id` AUTOINCREMENT),
    UNIQUE (`id`)
);
