USE car_app;

SELECT c.Make, c.Model, m.Name AS Manufacturer 
FROM Cars c 
CROSS JOIN Manufacturer m;

SELECT * FROM Cars ORDER BY Cost ASC;
SELECT * FROM Cars ORDER BY Cost DESC;

SELECT Make, COUNT(*) AS CarCount 
FROM Cars 
GROUP BY Make
HAVING CarCount = 1;

SELECT DISTINCT Make FROM Cars;

SELECT * FROM Cars WHERE Make LIKE 'H%';

SELECT * FROM Cars WHERE Cost BETWEEN 25000 AND 35000;

SELECT * FROM Cars WHERE Make IN ('Toyota', 'Honda', 'Ford');

SELECT COUNT(*) AS CarCount FROM Cars;

SELECT Make, Model, TRUNCATE(Cost * 0.9, 0) AS DiscountedCost FROM Cars;

SELECT UPPER(Make) AS UppercaseMake FROM Cars;

SELECT c.Make, c.Model, t.Brand AS TireBrand
FROM Cars c
LEFT JOIN Tires t ON c.TiresID = t.TiresID;

SELECT m.Name AS Manufacturer, AVG(e.Power) AS AvgPower
FROM Cars c
JOIN Manufacturer m ON c.ManufacturerID = m.ManufacturerID
JOIN Engine e ON c.EngineID = e.EngineID
GROUP BY m.ManufacturerID, m.Name;

UPDATE Cars
SET Cost = 30000
WHERE ManufacturerID = 2 AND Model = 'Mustang' AND Version = 'GT';

UPDATE Cars
SET OwnerID = 9
WHERE Make = 'Toyota' AND TransmissionID = 1 AND EngineID IN (SELECT EngineID FROM Engine WHERE Cylinders = 6);

UPDATE Manufacturer
SET Owner = 'Alex Johnson'
WHERE Country = 'USA' AND YearFounded < '2000-01-01';

UPDATE Manufacturer
SET HQLocation = 'Munich, Germany'
WHERE Country = 'Germany' AND (YearFounded > '2013-01-01' OR Name = 'BMW');

UPDATE Engine
SET Power = 250
WHERE Turbocharged = 1 AND FuelID IN (SELECT FuelID FROM Fuel WHERE OctaneRating > 90);

UPDATE Engine
SET FuelID = 1
WHERE Cylinders = 4 AND Power > 200;

UPDATE Fuel
SET OctaneRating = 95
WHERE EnergyContent > 30 AND Type = 'Gasoline';

UPDATE Fuel
SET Availability = 0
WHERE Type = 'Biodiesel' OR Type = 'Propane';

UPDATE Owner
SET Address = '123 Oak St'
WHERE Surname = 'Lee' AND City = 'Seattle';

UPDATE Chassis
SET Weight = 4000
WHERE BodyType = 'SUV' AND Wheelbase < 120;

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
SET TirePressure = 38
WHERE Brand = 'Goodyear' AND Size > 17;

UPDATE Tires
SET Size = 20
WHERE TirePressure < 33 AND TreadPattern = 'All-Season';

DELETE FROM Cars
WHERE Cost > 350000 AND (Make = 'BMW' OR Make = 'Mercedes-Benz');

DELETE FROM Cars
WHERE OwnerID IN (SELECT OwnerID FROM Owner WHERE City = 'Los Angeles');

DELETE FROM Manufacturer
WHERE HQLocation = 'Tokyo, Japan' AND Name NOT LIKE 'Honda%';

DELETE FROM Engine
WHERE Cylinders = 4 AND Turbocharged = 0;

DELETE FROM Engine
WHERE Power < 150 OR FuelID = 3;

DELETE FROM Fuel
WHERE Type = 'Methanol' AND OctaneRating > 95;

DELETE FROM Fuel
WHERE Availability = 0 AND EnergyContent > 35;

DELETE FROM Chassis
WHERE BodyType = 'Convertible' AND Weight > 2600;

DELETE FROM Transmission
WHERE Gears = 6 AND (SequentialShift = 0 OR Type = 'Manual');

DELETE FROM Tires
WHERE Brand = 'Michelin' AND Size < 18;

DELETE FROM Tires
WHERE TirePressure >= 35 AND TreadPattern IN ('Summer', 'Performance');