#Task 1

CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN BookingDate DATE)
BEGIN
INSERT INTO booking (bookingid, customerid, tablenumber, date) VALUES (BookingID, CustomerID, TableNumber, BookingDate)
END;

#Task 2

CREATE PROCEDURE UpdateBooking (IN BookingID INT, IN BookingDate DATE)
BEGIN
UPDATE booking SET date = BookingDate WHERE booking_id = BookingID;
END;


#Task 3

CREATE  PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
DELETE FROM booking WHERE booking_id = BookingID;
END;