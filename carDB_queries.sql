USE car_app;
UPDATE Cars
SET Cost = 30000.0
WHERE ManufacturerID = 2 AND Model = 'Mustang' AND Version = 'GT';

UPDATE Cars
SET OwnerID = 9
WHERE Make = 'Toyota' AND TransmissionID = 1 AND EngineID IN (SELECT EngineID FROM Engine WHERE Cylinders = 6);

UPDATE Manufacturer
SET Owner = 'Alex Johnson'
WHERE Country = 'USA' AND YearFounded < '2000-01-01';

UPDATE Manufacturer
SET HQLocation = 'Munich, Germany'
WHERE Country = 'Germany' AND (YearFounded > '1930-01-01' OR Name = 'BMW');

UPDATE Engine
SET Power = 250.0
WHERE Turbocharged = 1 AND FuelID IN (SELECT FuelID FROM Fuel WHERE OctaneRating > 90);

UPDATE Engine
SET FuelID = 1
WHERE Cylinders = 4 AND Power > 200.0;

UPDATE Fuel
SET OctaneRating = 95
WHERE EnergyContent > 30.0 AND Type = 'Gasoline';

UPDATE Fuel
SET Availability = 0
WHERE Type = 'Biodiesel' OR Type = 'Propane';

UPDATE Owner
SET Phone = 555111222
WHERE CarID IN (SELECT CarID FROM Cars WHERE Make = 'Nissan' AND Model = 'Altima');

UPDATE Owner
SET Address = '123 Oak St'
WHERE Surname = 'Lee' AND City = 'Seattle';

UPDATE Chassis
SET Weight = 4000.0
WHERE BodyType = 'SUV' AND Wheelbase < 120.0;

UPDATE Chassis
SET Doors = 2
WHERE BodyType = 'Sports Car';

UPDATE Transmission
SET Gears = 8
WHERE SequentialShift = 1 AND Type = 'Automatic';

UPDATE Transmission
SET Type = 'CVT'
WHERE Gears = 7 AND Name IN ('Automatic', 'Manual');

UPDATE Tires
SET TirePressure = 38.0
WHERE Brand = 'Goodyear' AND Size > 17.0;

UPDATE Tires
SET Size = 20.5
WHERE TirePressure < 33.0 AND TreadPattern = 'All-Season';


DELETE FROM Cars
WHERE Cost > 35000.0 AND (Make = 'BMW' OR Make = 'Mercedes-Benz');

DELETE FROM Cars
WHERE OwnerID IN (SELECT OwnerID FROM Owner WHERE City = 'Los Angeles');

DELETE FROM Manufacturer
WHERE YearFounded < '1950-01-01' AND (Country = 'USA' OR Country = 'Germany');

DELETE FROM Manufacturer
WHERE HQLocation = 'Tokyo, Japan' AND Name NOT LIKE 'Honda%';

DELETE FROM Engine
WHERE Cylinders = 4 AND Turbocharged = 0;

DELETE FROM Engine
WHERE Power < 150.0 OR FuelID = 3;

DELETE FROM Fuel
WHERE Type = 'Methanol' AND OctaneRating > 95;

DELETE FROM Fuel
WHERE Availability = 0 AND EnergyContent > 35.0;

DELETE FROM Owner
WHERE City = 'Phoenix' AND (CarID = 6 OR CarID = 7);

DELETE FROM Chassis
WHERE BodyType = 'Convertible' AND Weight > 2600.0;

DELETE FROM Chassis
WHERE Doors = 4 AND Wheelbase > 110.0;

DELETE FROM Transmission
WHERE Gears = 6 AND (SequentialShift = 0 OR Type = 'Manual');

DELETE FROM Transmission
WHERE Name IN ('CVT', 'Automatic') AND Type = 'Automatic';

DELETE FROM Tires
WHERE Brand = 'Michelin' AND Size < 18.0;

DELETE FROM Tires
WHERE TirePressure >= 35.0 AND TreadPattern IN ('Summer', 'Performance');
