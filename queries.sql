-- - Query 1 - --
-- SELECT * FROM Dealerships;

-- - Query 2 - --
-- SELECT i.Dealership_id, v.*
-- 	FROM Vehicles AS v
--     JOIN Inventory As i
-- 		ON v.VIN = i.VIN
--     WHERE Dealership_id = 1;

-- - Query 3 - --
-- SELECT *
-- 	FROM Vehicles
--     WHERE VIN = 12345;

-- - Query 4 - --
-- SELECT i.VIN, d.*
-- 	FROM Dealerships AS d
--     JOIN Inventory AS i
-- 		ON d.Dealership_id = i.Dealership_id
-- 	WHERE i.VIN = 12345;

-- - Alternative to Query 4 - --
-- SELECT *
-- 	FROM Dealerships
--     WHERE Dealership_id IN (SELECT Dealership_id
-- 								FROM Inventory
-- 								WHERE VIN = 12345);

-- - Query 5 - --
-- SELECT *
-- 	FROM Dealerships
--     WHERE Dealership_id IN (SELECT Dealership_id
-- 								FROM Inventory
-- 								WHERE VIN IN (SELECT VIN
-- 												FROM Vehicles
-- 												WHERE Vehicle_Color LIKE 'Red' 
-- 													AND Make_Name LIKE 'Ford'
-- 													AND Model_Name LIKE 'Explorer'));

-- - Query 6 - --
SELECT i.*, Year, Make_Name, Model_Name, Vehicle_Type, Vehicle_Color, Mileage, Vehicle_Price, SOLD
	FROM Inventory AS i
    JOIN Vehicles AS v
		ON i.VIN = v.VIN
	WHERE i.Dealership_id IN (SELECT Dealership_id
								FROM Inventory
								WHERE Dealership_id = 1
									AND (VIN IN (SELECT VIN
												FROM Sales_Contracts
                                                WHERE Contract_Date BETWEEN 20240000 AND 20250000)
									OR VIN IN (SELECT VIN
												FROM Lease_Contracts
                                                WHERE Contract_Date BETWEEN 20240000 AND 20250000)));