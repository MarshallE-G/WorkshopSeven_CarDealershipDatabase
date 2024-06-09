-- SELECT * FROM Dealerships;

SELECT i.Dealership_id, v.*
	FROM Vehicles AS v
    JOIN Inventory As i
		ON v.VIN = i.VIN
    WHERE Dealership_id = 1;