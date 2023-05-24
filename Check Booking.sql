#Task 1

INSERT INTO booking(BookingID, BookingDate, TableNumber)
VALUES 
(1, '2022-10-10', 5),
(2, '2022-11-12', 3),
(3, '2022-10-11', 2),
(4, '2022-10-13', 2);

#Task 2
DELIMITER $$
CREATE PROCEDURE `CheckBooking`(IN Booking_Date varchar(20), IN Table_Number INT)
BEGIN
	DECLARE Table_Status VARCHAR(20) DEFAULT NULL;
    
    SELECT BookingID
    INTO Table_Status
    FROM Bookings
    WHERE BookingDate = Booking_Date AND TableNumber = Table_Number;
    
    SELECT
		CASE 
			WHEN Table_Status IS NOT NULL 
				THEN CONCAT('Table ', Table_Number, ' is already booked') 
			ELSE CONCAT('Table ', Table_Number, ' is available for booking')
		END 'Booking Status';

END$$
DELIMITER ;


#Task 3

DELIMITER $$
CREATE PROCEDURE `AddValidBooking`(IN Booking_date VARCHAR(20), IN Table_Number INT)
BEGIN
	DECLARE Status VARCHAR(20);
    
    START TRANSACTION;
    
    SELECT BookingID 
    INTO Status
    FROM Bookings
    WHERE BookingDate = Booking_Date AND TableNumber = Table_Number;
    
    INSERT INTO Bookings(BookingDate, TableNumber)
    VALUES(Booking_Date, Table_Number);
    
    IF Status IS NOT NULL 
		THEN 
			ROLLBACK; SELECT CONCAT('Table ', Table_Number, ' is already booked - Booking Cancelled') AS 'Booking Status'; 
		ELSE 
			COMMIT; SELECT CONCAT('Table ', Table_Number, ' is available for booking - Booking...') AS 'Booking Status'; 
		END IF;
END$$
DELIMITER ;

