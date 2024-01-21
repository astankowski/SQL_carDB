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
    ('Gasoline', 87, 35.8, 1),
    ('Diesel', 45, 32.5, 1),
    ('Electric', 0, 0, 0),
    ('Hybrid', 91, 30.0, 1),
    ('Natural Gas', 110, 39.5, 0),
    ('Biodiesel', 50, 31.0, 0),
    ('Propane', 95, 34.2, 0),
    ('E85', 85, 33.7, 1),
    ('Methanol', 98, 29.8, 0),
    ('Ethanol', 90, 30.5, 1);

INSERT INTO Engine (Cylinders, Power, FuelID, Turbocharged)
VALUES
    (4, 150.5, 1, 0),
    (6, 250.2, 2, 1),
    (4, 120.0, 3, 0),
    (4, 180.3, 4, 1),
    (6, 270.8, 5, 0),
    (4, 160.7, 6, 1),
    (6, 220.0, 7, 0),
    (4, 135.2, 8, 1),
    (6, 240.5, 9, 0),
    (4, 155.0, 10, 0);

INSERT INTO Owner (Name, Surname, Email, Phone, Address, City)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 1234567890, '123 Main St', 'New York'),
    ('Jane', 'Smith', 'jane.smith@example.com', 9876543210, '456 Elm St', 'Los Angeles'),
    ('Robert', 'Johnson', 'robert.johnson@example.com', 5551234567, '789 Oak St', 'Chicago'),
    ('Susan', 'Williams', 'susan.williams@example.com', 4445556666, '321 Pine St', 'Houston'),
    ('Michael', 'Anderson', 'michael.anderson@example.com', 7778889999, '567 Birch St', 'Miami'),
    ('Laura', 'Taylor', 'laura.taylor@example.com', 2223334444, '654 Cedar St', 'Phoenix'),
    ('David', 'Martinez', 'david.martinez@example.com', 3332221111, '987 Oak St', 'San Francisco'),
    ('Jennifer', 'Harris', 'jennifer.harris@example.com', 6667778888, '345 Maple St', 'Boston'),
    ('William', 'Lee', 'william.lee@example.com', 9998887777, '234 Pine St', 'Seattle'),
    ('Sarah', 'Garcia', 'sarah.garcia@example.com', 1112223333, '789 Elm St', 'Dallas');

INSERT INTO Chassis (Doors, BodyType, Weight, Wheelbase)
VALUES
    (4, 'Sedan', 3500.5, 110.2),
    (2, 'Sports Car', 2800.0, 95.0),
    (4, 'SUV', 4200.7, 120.5),
    (4, 'Hatchback', 2900.8, 100.0),
    (2, 'Convertible', 2600.3, 98.5),
    (4, 'Crossover', 3900.6, 115.0),
    (4, 'Coupe', 3100.4, 105.5),
    (2, 'Roadster', 2500.2, 92.7),
    (4, 'Minivan', 3800.7, 115.8),
    (2, 'SUV', 4500.9, 125.0);

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
    ('Michelin', 17.0, 'All-Season', 32.0),
    ('Bridgestone', 18.5, 'Summer', 35.0),
    ('Goodyear', 16.5, 'Winter', 30.0),
    ('Pirelli', 18.0, 'All-Season', 33.0),
    ('Continental', 17.5, 'Summer', 34.0),
    ('Firestone', 16.0, 'Winter', 32.5),
    ('Dunlop', 17.5, 'All-Season', 31.0),
    ('Hankook', 18.0, 'Summer', 36.0),
    ('Toyo', 16.0, 'Winter', 29.5),
    ('Yokohama', 17.0, 'All-Season', 33.5);

INSERT INTO Cars (Make, Model, Version, Cost, ManufacturerID, EngineID, ChassisID, TiresID, TransmissionID, OwnerID)
VALUES
    ('Toyota', 'Camry', 'LE', 25000.0, 1, 1, 1, 1, 1, 1),
    ('Ford', 'Mustang', 'GT', 35000.0, 2, 2, 2, 2, 2, 2),
    ('Honda', 'Civic', 'EX', 22000.0, 3, 3, 3, 3, 3, 3),
    ('Volkswagen', 'Golf', 'TSI', 28000.0, 4, 4, 4, 4, 4, 4),
    ('Chevrolet', 'Cruze', 'LT', 23000.0, 5, 5, 5, 5, 5, 5),
    ('Nissan', 'Altima', 'S', 26000.0, 6, 6, 6, 6, 6, 6),
    ('BMW', '3 Series', '320i', 42000.0, 7, 7, 7, 7, 7, 7),
    ('Mercedes-Benz', 'C-Class', 'C300', 45000.0, 8, 8, 8, 8, 8, 8),
    ('Audi', 'A4', 'Premium', 38000.0, 9, 9, 9, 9, 9, 9),
    ('Hyundai', 'Elantra', 'SE', 22000.0, 10, 10, 10, 10, 10, 10);