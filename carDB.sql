CREATE DATABASE car_app;
USE car_app;
CREATE TABLE `Cars` (
    `CarID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Make` VARCHAR(255) NOT NULL,
    `Model` VARCHAR(255) NOT NULL,
    `Version` VARCHAR(255) NOT NULL,
    `Cost` DECIMAL NOT NULL,
    `ManufacturerID` INT NOT NULL,
    `EngineID` INT NOT NULL,
    `ChassisID` INT NOT NULL,
    `TiresID` INT NOT NULL,
    `TransmissionID` int NOT NULL,
    `OwnerID` int NOT NULL,
    PRIMARY KEY (`CarID`)
);

CREATE TABLE `Manufacturer` (
    `ManufacturerID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Name` VARCHAR(255) NOT NULL,
    `Owner` VARCHAR(255) NOT NULL,
    `Country` VARCHAR(255) NOT NULL,
    `YearFounded` DATE NOT NULL,
    `HQLocation` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`ManufacturerID`)
);

CREATE TABLE `Engine` (
    `EngineID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Cylinders` INT NOT NULL,
    `Power` DECIMAL NOT NULL,
    `FuelID` INT NOT NULL,
    `Turbocharged` BOOLEAN NOT NULL,
    PRIMARY KEY (`EngineID`)
);

CREATE TABLE `Fuel` (
    `FuelID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Type` VARCHAR(255) NOT NULL,
    `OctaneRating` DECIMAL NOT NULL,
    `EnergyContent` DECIMAL NOT NULL,
    `Availability` INT NOT NULL,
    PRIMARY KEY (`FuelID`)
);

CREATE TABLE `Owner` (
    `OwnerID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Name` VARCHAR(255) NOT NULL,
    `Surname` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Phone` INT NOT NULL,
    `Address` VARCHAR(255) NOT NULL,
    `City` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`OwnerID`)
);

CREATE TABLE `Chassis` (
    `ChassisID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Doors` INT NOT NULL,
    `BodyType` VARCHAR(255) NOT NULL,
    `Weight` DECIMAL NOT NULL,
    `Wheelbase` DECIMAL NOT NULL,
    PRIMARY KEY (`ChassisID`)
);

CREATE TABLE `Transmission` (
    `TransmissionID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Name` VARCHAR(255) NOT NULL,
    `Type` VARCHAR(255) NOT NULL,
    `Gears` INT NOT NULL,
    `SequentialShift` BOOLEAN NOT NULL,
    PRIMARY KEY (`TransmissionID`)
);

CREATE TABLE `Tires` (
    `TiresID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Brand` VARCHAR(255) NOT NULL,
    `Size` DECIMAL NOT NULL,
    `TreadPattern` VARCHAR(255) NOT NULL,
    `TirePressure` DECIMAL NOT NULL,
    PRIMARY KEY (`TiresID`)
);

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk0` FOREIGN KEY (`ManufacturerID`) REFERENCES `Manufacturer`(`ManufacturerID`) ON DELETE CASCADE;

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk1` FOREIGN KEY (`EngineID`) REFERENCES `Engine`(`EngineID`) ON DELETE CASCADE;

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk2` FOREIGN KEY (`ChassisID`) REFERENCES `Chassis`(`ChassisID`) ON DELETE CASCADE;

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk3` FOREIGN KEY (`TiresID`) REFERENCES `Tires`(`TiresID`) ON DELETE CASCADE;

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk4` FOREIGN KEY (`TransmissionID`) REFERENCES `Transmission`(`TransmissionID`) ON DELETE CASCADE;

ALTER TABLE `Cars` ADD CONSTRAINT `Cars_fk5` FOREIGN KEY (`OwnerID`) REFERENCES `Owner`(`OwnerID`) ON DELETE CASCADE;

ALTER TABLE `Engine` ADD CONSTRAINT `Engine_fk0` FOREIGN KEY (`FuelID`) REFERENCES `Fuel`(`FuelID`) ON DELETE CASCADE;

INSERT INTO Manufacturer (Name, Owner, Country, YearFounded, HQLocation)
VALUES
    ('Toyota', 'Toyota Corporation', 'Japan', '1937-08-28', 'Toyota City, Japan'),
    ('Ford', 'Ford Motor Company', 'USA', '1903-06-16', 'Dearborn, Michigan, USA'),
    ('Honda', 'Honda Motor Co., Ltd.', 'Japan', '1948-09-24', 'Tokyo, Japan'),
    ('Volkswagen', 'Volkswagen Group', 'Germany', '1937-05-28', 'Wolfsburg, Germany'),
    ('Chevrolet', 'Chevrolet Division', 'USA', '1911-11-03', 'Detroit, Michigan, USA'),
    ('Nissan', 'Nissan Motor Co., Ltd.', 'Japan', '1933-12-26', 'Yokohama, Japan'),
    ('BMW', 'Bayerische Motoren Werke AG', 'Germany', '1916-03-07', 'Munich, Germany'),
    ('Mercedes-Benz', 'Daimler AG', 'Germany', '1926-06-28', 'Stuttgart, Germany'),
    ('Audi', 'Audi AG', 'Germany', '1932-05-24', 'Ingolstadt, Germany'),
    ('Hyundai', 'Hyundai Motor Company', 'South Korea', '1967-12-29', 'Seoul, South Korea');

INSERT INTO Fuel (Type, OctaneRating, EnergyContent, Availability)
VALUES
    ('Gasoline', 87, 35, 1),
    ('Diesel', 45, 32, 1),
    ('Electric', 0, 0, 0),
    ('Hybrid', 91, 30, 1),
    ('Natural Gas', 110, 39, 0),
    ('Biodiesel', 50, 31, 0),
    ('Propane', 95, 34, 0),
    ('E85', 85, 33, 1),
    ('Methanol', 98, 29, 0),
    ('Ethanol', 90, 30, 1);

INSERT INTO Engine (Cylinders, Power, FuelID, Turbocharged)
VALUES
    (4, 150, 1, 0),
    (6, 250, 2, 1),
    (4, 120, 3, 0),
    (4, 180, 4, 1),
    (6, 270, 5, 0),
    (4, 160, 6, 1),
    (6, 220, 7, 0),
    (4, 135, 8, 1),
    (6, 240, 9, 0),
    (4, 155, 10, 0);

INSERT INTO Owner (Name, Surname, Email, Phone, Address, City)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 123456780, '123 Main St', 'New York'),
    ('Jane', 'Smith', 'jane.smith@example.com', 987543210, '456 Elm St', 'Los Angeles'),
    ('Robert', 'Johnson', 'robert.johnson@example.com', 551234567, '789 Oak St', 'Chicago'),
    ('Susan', 'Williams', 'susan.williams@example.com', 444556666, '321 Pine St', 'Houston'),
    ('Michael', 'Anderson', 'michael.anderson@example.com', 778889999, '567 Birch St', 'Miami'),
    ('Laura', 'Taylor', 'laura.taylor@example.com', 222333444, '654 Cedar St', 'Phoenix'),
    ('David', 'Martinez', 'david.martinez@example.com', 333221111, '987 Oak St', 'San Francisco'),
    ('Jennifer', 'Harris', 'jennifer.harris@example.com', 667778888, '345 Maple St', 'Boston'),
    ('William', 'Lee', 'william.lee@example.com', 999888777, '234 Pine St', 'Seattle'),
    ('Sarah', 'Garcia', 'sarah.garcia@example.com', 111223333, '789 Elm St', 'Dallas');

INSERT INTO Chassis (Doors, BodyType, Weight, Wheelbase)
VALUES
    (4, 'Sedan', 3500, 110),
    (2, 'Sports Car', 2800, 95),
    (4, 'SUV', 4200, 120),
    (4, 'Hatchback', 2900, 100),
    (2, 'Convertible', 2600, 98),
    (4, 'Crossover', 3900, 115),
    (4, 'Coupe', 3100, 105),
    (2, 'Roadster', 2500, 92),
    (4, 'Minivan', 3800, 115),
    (2, 'SUV', 4500, 125);

INSERT INTO Transmission (Name, Type, Gears, SequentialShift)
VALUES
    ('Automatic', 'Automatic', 6, 1),
    ('Manual', 'Manual', 5, 0),
    ('CVT', 'Continuously Variable Transmission', 7, 0),
    ('Automatic', 'Automatic', 8, 1),
    ('Manual', 'Manual', 6, 0),
    ('Automatic', 'Automatic', 7, 1),
    ('Automatic', 'Automatic', 9, 1),
    ('Manual', 'Manual', 5, 0),
    ('Automatic', 'Automatic', 8, 1),
    ('CVT', 'Continuously Variable Transmission', 7, 0);

INSERT INTO Tires (Brand, Size, TreadPattern, TirePressure)
VALUES
    ('Michelin', 17, 'All-Season', 32),
    ('Bridgestone', 18, 'Summer', 35),
    ('Goodyear', 16, 'Winter', 30),
    ('Pirelli', 18, 'All-Season', 33),
    ('Continental', 17, 'Summer', 34),
    ('Firestone', 16, 'Winter', 32),
    ('Dunlop', 17, 'All-Season', 31),
    ('Hankook', 18, 'Summer', 36),
    ('Toyo', 16, 'Winter', 29),
    ('Yokohama', 17, 'All-Season', 33);

INSERT INTO Cars (Make, Model, Version, Cost, ManufacturerID, EngineID, ChassisID, TiresID, TransmissionID, OwnerID)
VALUES
    ('Toyota', 'Camry', 'LE', 25000, 1, 1, 1, 1, 1, 1),
    ('Ford', 'Mustang', 'GT', 35000, 2, 2, 2, 2, 2, 2),
    ('Honda', 'Civic', 'EX', 22000, 3, 3, 3, 3, 3, 3),
    ('Volkswagen', 'Golf', 'TSI', 28000, 4, 4, 4, 4, 4, 4),
    ('Chevrolet', 'Cruze', 'LT', 23000, 5, 5, 5, 5, 5, 5),
    ('Nissan', 'Altima', 'S', 26000, 6, 6, 6, 6, 6, 6),
    ('BMW', '3 Series', '320i', 42000, 7, 7, 7, 7, 7, 7),
    ('Mercedes-Benz', 'C-Class', 'C300', 45000, 8, 8, 8, 8, 8, 8),
    ('Audi', 'A4', 'Premium', 38000, 9, 9, 9, 9, 9, 9),
    ('Hyundai', 'Elantra', 'SE', 22000, 10, 10, 10, 10, 10, 10);
