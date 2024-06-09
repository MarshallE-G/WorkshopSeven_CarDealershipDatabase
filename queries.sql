-- SELECT * FROM Dealerships;

-- SELECT i.Dealership_id, v.*
-- 	FROM Vehicles AS v
--     JOIN Inventory As i
-- 		ON v.VIN = i.VIN
--     WHERE Dealership_id = 1;

-- SELECT *
-- 	FROM Vehicles
--     WHERE VIN = 12345;

SELECT i.VIN, d.*
	FROM Dealerships AS d
    JOIN Inventory AS i
		ON d.Dealership_id = i.Dealership_id
	WHERE i.VIN = 12345;