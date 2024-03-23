--Cleaning database
drop table if exists Employee cascade;
drop table if exists Customer cascade;
drop table if exists BookingArchive cascade;
drop table if exists RentingArchive cascade;
drop table if exists Hotel cascade;
drop table if exists HotelChain cascade;
drop table if exists Hotel_PhoneNumber cascade;
drop table if exists HotelChain_PhoneNumber cascade;
drop table if exists Room cascade;
drop table if exists Renting cascade;
drop table if exists Booking cascade;

--HotelChain Table Structure
Create Table HotelChain(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	num_hotels int CHECK (num_hotels BETWEEN 1 AND 1000),
	email VARCHAR(255) CHECK (email like '%@%'),
	street VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
	PRIMARY KEY (hotelChainID)
);

INSERT INTO HotelChain(hotelChainID,num_hotels,email,street,city,province, PostalCode)
VALUES
    (1, 9,'hotel1@gmail.com','123 XYZ Street', 'Ottawa','ONTARIO','A3S0G9'),
	(2, 8,'hotel2@gmail.com','345 Queen Street', 'Toronto','ONTARIO','B7S9G8'),
	(3, 8,'hotel3@gmail.com','123 Elm Street', 'Victoria','British Columbia','C9R0G9'),
	(4, 8,'hotel4@gmail.com','769 ABC Street', 'Ottawa','ONTARIO','A8B3V8'),
	(5, 10,'hotel5@gmail.com','475 Zero Street', 'London','ONTARIO','P4Q9G9');

--Table Structure Hotel
CREATE TABLE Hotel (
    hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
    hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
    num_rooms int CHECK (num_rooms BETWEEN 1 AND 100),
    email VARCHAR(255) CHECK (email like '%@%'),
    star_rating int CHECK (star_rating >= 1 AND star_rating <= 5),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(6) NOT NULL CHECK (LENGTH(PostalCode) BETWEEN 5 AND 6),
    PRIMARY KEY (hotelID, hotelChainID),
	FOREIGN KEY (hotelChainID)
	REFERENCES HotelChain
);

INSERT INTO Hotel(hotelID, hotelChainID, num_rooms,email,star_rating,street,city,province, PostalCode)
VALUES
    (1, 1, 60, 'hotel11@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '123458'),
	(2, 1, 80, 'hotel21@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '23456'),
	(3, 1, 90, 'hotel31@gmail.com', 3, '789 Silver St', 'Brockville', 'North America', '123567'),
	(4, 1, 100, 'hotel41@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '45678'),
	(5, 1, 100, 'hotel51@gmail.com', 5, '654 Cedar St', 'Ruraltown', 'North America', '56789'),
	(6, 1, 60, 'hotel61@gmail.com', 3, '133 Main St', 'Cityville', 'North America', '123458'),
    (7, 1, 80, 'hotel71@gmail.com', 5, '466 llm St', 'Brownsville', 'North America', '234566'),
    (8, 1, 90, 'hotel81@gmail.com', 3, '899 Oak St', 'Villageton', 'North America', '34567'),
    (1, 2, 60, 'hotel12@gmail.com', 3, '133 Main St', 'Cityville', 'North America', '12346'),
	(2, 2, 80, 'hotel22@gmail.com', 5, '466 Elm St', 'Townsville', 'North America', '23457'),
	(3, 2, 90, 'hotel32@gmail.com', 3, '780 Oak St', 'Villageton', 'North America', '34568'),
	(4, 2, 100, 'hotel42@gmail.com', 4, '987 Cedar St', 'Ruraltown', 'North America', '45679'),
	(5, 2, 100, 'hotel52@gmail.com', 5, '989 Cedar St', 'Ruraltown', 'North America', '45679'),
	(6, 2, 100, 'hotel62@gmail.com', 4, '988 Pine St', 'Hamletville', 'North America', '45670'),
    (7, 2, 100, 'hotel72@gmail.com', 5, '655 Aedar St', 'Ruraltown', 'North America', '56780'),
	(8, 2, 100, 'hotel82@gmail.com', 5, '654 Brock St', 'Ruraltown', 'North America', '56781'),
	(1, 3, 60, 'hotel13@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '12349'),
    (2, 3, 80, 'hotel23@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '23450'),
    (3, 3, 90, 'hotel33@gmail.com', 3, '789 Empire St', 'Villageton', 'North America', '34569'),
    (4, 3, 100, 'hotel43@gmail.com', 4, '986 Cedar St', 'Ruraltown', 'North America', '45670'),
    (5, 3, 100, 'hotel53@gmail.com', 5, '988 Cedar St', 'Ruraltown', 'North America', '45670'),
    (6, 3, 100, 'hotel63@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '45688'),
    (7, 3, 100, 'hotel73@gmail.com', 5, '654 Aedar St', 'Ruraltown', 'North America', '56782'),
    (8, 3, 60, 'hotel83@gmail.com', 3, '124 Brock St', 'Cityville', 'North America', '12348'),
    (1, 4, 60, 'hotel14@gmail.com', 3, '123 Main St', 'Cityville', 'North America', '11335'),
    (2, 4, 80, 'hotel24@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '22446'),
    (3, 4, 90, 'hotel34@gmail.com', 3, '789 Brock St', 'Villageton', 'North America', '33557'),
    (4, 4, 100, 'hotel44@gmail.com', 4, '912 Cedar St', 'Ruraltown', 'North America', '44678'),
    (5, 4, 100, 'hotel54@gmail.com', 5, '913 Cedar St', 'Ruraltown', 'North America', '44678'),
    (6, 4, 100, 'hotel64@gmail.com', 4, '987 Pine St', 'Hamletville', 'North America', '44678'),
    (7, 4, 100, 'hotel74@gmail.com', 5, '654 Empire St', 'Ruraltown', 'North America', '57799'),
    (8, 4, 60, 'hotel84@gmail.com', 3, '178 Brock St', 'Cityville', 'North America', '12289'),
    (1, 5, 80, 'hotel15@gmail.com', 5, '456 Elm St', 'Townsville', 'North America', '17456'),
    (2, 5, 90, 'hotel25@gmail.com', 3, '789 Main St', 'Villageton', 'North America', '24567'),
    (3, 5, 100, 'hotel35@gmail.com', 4, '914 Cedar St', 'Ruraltown', 'North America', '45579'),
    (4, 5, 100, 'hotel45@gmail.com', 5, '915 Cedar St', 'Ruraltown', 'North America', '45579'),
    (5, 5, 100, 'hotel55@gmail.com', 4, '427 Pine St', 'Hamletville', 'North America', '34678'),
    (6, 5, 100, 'hotel65@gmail.com', 5, '800 Natural St', 'Newtown', 'North America', '36789'),
    (7, 5, 100, 'hotel75@gmail.com', 5, '196 East St', 'Urbantown', 'North America', '32789'),
    (8, 5, 100, 'hotel85@gmail.com', 5, '111 Brock St', 'Brockville', 'North America', '33789');

--Table Structure HotelChain_PhoneNumber
Create Table HotelChain_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	Primary Key (hotelChainID, PhoneNumber),
	FOREIGN KEY (hotelChainID)
	References HotelChain
);

INSERT INTO HotelChain_PhoneNumber(hotelChainID, PhoneNumber)
VALUES
    (1,123456789),
	(2,231456789),
	(3,321456789),
	(4,412356789),
	(5,512346789);

--Table Structure:Hotel_PhoneNumber
Create Table Hotel_PhoneNumber(
	hotelChainID int NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
	PhoneNumber NUMERIC(10,0) Not Null,
	hotelID int NOT NULL CHECK (hotelID >= 1 AND hotelID <= 1000),
	Primary Key (hotelChainID, PhoneNumber,hotelID),
	FOREIGN KEY(hotelID,hotelChainID)
	References Hotel
);

INSERT INTO Hotel_PhoneNumber(hotelID,hotelChainID,PhoneNumber)
VALUES
    (1,1,100000009),
	(2,1,100000008),
	(3,1,100000007),
	(4,1,100000006),
	(5,1,100000005),
	(6,1,100000004),
    (7,1,100000003),
    (8,1,100000002),
    (1,2,200000009),
   	(2,2,200000008),
   	(3,2,200000007),
   	(4,2,200000006),
   	(5,2,200000005),
   	(6,2,200000004),
    (7,2,200000003),
    (8,2,200000002),
    (1,3,300000009),
    (2,3,300000008),
    (3,3,300000007),
    (4,3,300000006),
    (5,3,300000005),
    (6,3,300000004),
    (7,3,300000003),
    (8,3,300000002),
    (1,4,400000009),
    (2,4,400000008),
    (3,4,400000007),
    (4,4,400000006),
    (5,4,400000005),
    (6,4,400000004),
    (7,4,400000003),
    (8,4,400000002),
    (1,5,500000009),
    (2,5,500000008),
    (3,5,500000007),
    (4,5,500000006),
    (5,5,500000005),
    (6,5,500000004),
    (7,5,500000003),
    (8,5,500000002);


--Table Structure:Employee
CREATE TABLE Employee (
    SSN_SIN NUMERIC(9,0) PRIMARY KEY CHECK (SSN_SIN > 0),
    hotelID INT NOT NULL CHECK (hotelID BETWEEN 1 AND 1000),
    hotelChainID INT NOT NULL CHECK (hotelChainID BETWEEN 1 AND 5),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province_state VARCHAR(100) NOT NULL,
    postal_code_zip_code VARCHAR(20) NOT NULL,
    Roles_chef BOOLEAN,
    Roles_maintenanceTechnician BOOLEAN,
    Roles_receptionist BOOLEAN,
    Roles_hotelKeeper BOOLEAN,
    FOREIGN KEY (hotelID, hotelChainID) REFERENCES Hotel(hotelID, hotelChainID),
    FOREIGN KEY (hotelChainID) REFERENCES HotelChain(hotelChainID)
);


-- Sample Employees
INSERT INTO Employee (SSN_SIN, HotelID, HotelChainID, first_name, middle_name, last_name, street, city, province_state, postal_code_zip_code, Roles_chef, Roles_maintenanceTechnician, Roles_receptionist, Roles_hotelKeeper)
VALUES
    (123456789, 1, 1, 'John', 'Doe', 'Smith', '123 Main St', 'Cityville', 'North America', '12345', true, false, true, false),
    (234567890, 2, 1, 'Jane', 'Doe', 'Johnson', '456 Elm St', 'Townsville', 'North America', '23456', false, true, false, true),
    (345678901, 3, 2, 'Michael', 'Johnson', 'Brown', '789 Oak St', 'Villageton', 'North America', '34567', true, false, false, true),
    (456789012, 4, 2, 'Emily', 'Williams', 'Taylor', '987 Pine St', 'Hamletville', 'North America', '45678', false, true, true, false),
    (567890123, 5, 3, 'David', 'Wilson', 'Anderson', '654 Cedar St', 'Ruraltown', 'North America', '56789', true, false, true, false);


--Table Structure: Customer
CREATE TABLE Customer (
    customer_ID NUMERIC(9,0) PRIMARY KEY CHECK (customer_ID > 0),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province_state VARCHAR(100) NOT NULL CHECK (province_state IN ('North America')),
    postal_code_zip_code VARCHAR(20) NOT NULL CHECK (LENGTH(postal_code_zip_code) BETWEEN 5 AND 6),
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    DateofRegistration DATE CHECK (DateofRegistration IS NOT NULL), -- Ensure DateofRegistration is not null
    CONSTRAINT valid_dateofregistration CHECK (DateofRegistration::TEXT ~ '^\d{4}-\d{2}-\d{2}$') -- Check format (YYYY-MM-DD)
);


--Sample customers
INSERT INTO Customer (customer_ID, street, city, province_state, postal_code_zip_code, first_name, middle_name, last_name, DateofRegistration)
VALUES
    (123456789, '123 Maple St', 'Cityville', 'North America', '12345', 'John', 'Doe', 'Smith', '2023-01-01'),
    (234567890, '456 Oak St', 'Townsville', 'North America', '23456', 'Jane', NULL, 'Johnson', '2023-01-02'),
    (345678901, '789 Elm St', 'Villageton', 'North America', '34567', 'Michael', 'James', 'Brown', '2023-01-03'),
    (456789012, '987 Pine St', 'Hamletville', 'North America', '45678', 'Emily', NULL, 'Taylor', '2023-01-04'),
    (567890123, '654 Cedar St', 'Ruraltown', 'North America', '56789', 'David', 'Wilson', 'Anderson', '2023-01-05');

--Table structure:Booking archive
CREATE TABLE BookingArchive (
    booking_ID NUMERIC(9,0) PRIMARY KEY CHECK (booking_ID > 0),
    booking_date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5)
);

--Sample booking archive
INSERT INTO BookingArchive (booking_ID, booking_date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID)
VALUES
    (567891234, '2023-01-01', 'John', 'Doe', 'Smith', 10001, 1, 1),
    (456789123, '2023-01-02', 'Jane', NULL, 'Johnson', 20002, 2, 2),
    (345678912, '2023-01-03', 'Michael', 'James', 'Brown', 30003, 3, 3);


--Table structure:Renting archive
CREATE TABLE RentingArchive (
    renting_ID NUMERIC(9,0) PRIMARY KEY CHECK (renting_ID > 0),
    Date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5)
);

--Sample renting archive
INSERT INTO RentingArchive (renting_ID, Date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID)
VALUES
    (123456789, '2023-01-01', 'John', 'Doe', 'Smith', 10001, 1, 1),
    (234567890, '2023-01-02', 'Jane', NULL, 'Johnson', 20002, 2, 2),
    (345678901, '2023-01-03', 'Michael', 'James', 'Brown', 30003, 3, 3);

--Table structure:Room
CREATE TABLE Room (
	room_number NUMERIC(5,0) PRIMARY KEY CHECK (room_number > 0),
	HotelID INT CHECK (HotelID BETWEEN 1 AND 1000),
    HotelChainID INT CHECK (HotelChainID BETWEEN 1 AND 5),
	problems_water BOOLEAN,
	problems_electrical BOOLEAN,
	problems_furniture BOOLEAN,
	problems_other VARCHAR(255),
	price DECIMAL(6,2) CHECK (price BETWEEN 100.00 AND 10000.00),
	amenities_tv BOOLEAN,
	amenities_wifi BOOLEAN,
	amenities_air_con BOOLEAN,
	amenities_fridge BOOLEAN,
	amenities_toiletries BOOLEAN,
	capacities_single BOOLEAN,
	capacities_double BOOLEAN,
	guest_capacity INT CHECK (guest_capacity BETWEEN 1 AND 5),
	sea_view BOOLEAN,
	mountain_view BOOLEAN,
	extendable BOOLEAN,
	not_extendable BOOLEAN,
    FOREIGN KEY (hotelID, hotelChainID) REFERENCES Hotel(hotelID, hotelChainID),
    FOREIGN KEY (hotelChainID) REFERENCES HotelChain(hotelChainID)
);

--sample rooms
INSERT INTO Room (room_number,  HotelID, HotelChainID, problems_water, problems_electrical, problems_furniture,
				 problems_other, price, amenities_tv, amenities_wifi, amenities_air_con, amenities_fridge,
				 amenities_toiletries, capacities_single, capacities_double, guest_capacity, sea_view, mountain_view,
				 extendable, not_extendable) VALUES
				 (10001, 1, 1, true, false, false, NULL, 110.50, true, true, true, true, true, true, false, 1, true, false, true, false),
				 (10002, 1, 1, true, true, false, NULL, 500.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (10003, 1, 1, false, false, true, NULL, 245.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (10004, 1, 1, false, false, false, NULL, 999.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (10005, 1, 1, false, false, false, 'too noisy', 150.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (20001, 2, 1, false, true, false, NULL, 110.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (20002, 2, 1, true, false, false, NULL, 500.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (20003, 2, 1, false, true, false, NULL, 245.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (20004, 2, 1, true, false, false, NULL, 999.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (20005, 2, 1, false, false, false, 'Odor in bathroom', 150.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (30001, 3, 1, false, true, false, NULL, 120.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (30002, 3, 1, true, false, true, NULL, 450.00, false, true, true, true, true, true, false, 4, true, false, false, true),
                 (30003, 3, 1, false, true, false, 'Musty odor in room', 265.50, true, false, false, true, true, false, true, 2, false, true, false, true),
                 (30004, 3, 1, true, false, true, NULL, 899.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (30005, 3, 1, false, false, false, 'too noisy', 170.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (40001, 4, 1, false, true, false, 'Weak Wi-Fi signal', 130.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (40002, 4, 1, true, false, false, NULL, 470.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (40003, 4, 1, false, true, false, NULL, 275.50, true, false, false, true, true, false, true, 5, false, true, false, true),
                 (40004, 4, 1, true, false, false, NULL, 929.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (40005, 4, 1, false, false, false, 'Musty odor in room', 180.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (50001, 5, 1, false, true, false, 'Weak Wi-Fi signal', 140.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (50002, 5, 1, true, false, false, NULL, 490.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (50003, 5, 1, false, true, false, NULL, 285.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (50004, 5, 1, true, false, false, NULL, 959.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (50005, 5, 1, false, false, false, 'Musty odor in room', 190.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (60001, 6, 1, false, true, false, 'Weak Wi-Fi signal', 150.50, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (60002, 6, 1, true, false, false, NULL, 510.00, false, true, true, true, true, true, false, 3, true, false, false, true),
                 (60003, 6, 1, false, true, false, NULL, 295.50, true, false, false, true, true, false, true, 5, false, true, false, true),
                 (60004, 6, 1, true, false, false, NULL, 989.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (60005, 6, 1, false, false, false, 'Musty odor in room', 200.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (70001, 7, 1, false, true, false, 'Too noisy', 160.50, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (70002, 7, 1, true, false, false, NULL, 530.00, false, true, true, true, true, true, false, 4, true, false, false, true),
                 (70003, 7, 1, false, true, false, NULL, 305.50, true, false, false, true, true, false, true, 1, false, true, false, true),
                 (70004, 7, 1, true, false, false, NULL, 1019.99, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (70005, 7, 1, false, false, false, 'Too hot', 210.50, true, true, false, false, true, false, true, 3, true, false, true, false),

                 (80001, 8, 1, false, true, false, 'Faulty lighting', 170.50, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (80002, 8, 1, true, false, false, NULL, 550.00, false, true, true, true, true, true, false, 3, true, false, false, true),
                 (80003, 8, 1, false, true, false, NULL, 315.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (80004, 8, 1, true, false, false, NULL, 149.99, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (80005, 8, 1, false, false, false, 'Stained carpet', 220.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (12001, 1, 2, false, true, false, 'Faulty air conditioning', 110.50, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (12002, 1, 2, true, false, false, NULL, 500.00, false, true, true, true, true, true, false, 3, true, false, false, true),
                 (12003, 1, 2, false, true, false, NULL, 245.50, true, false, false, true, true, false, true, 1, false, true, false, true),
                 (12004, 1, 2, true, false, false, NULL, 999.99, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (12005, 1, 2, false, false, false, 'Musty odor in room', 150.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (23001, 2, 2, false, true, false, 'Stained carpet', 120.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (23002, 2, 2, true, false, false, NULL, 510.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (23003, 2, 2, false, true, false, NULL, 255.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (23004, 2, 2, true, false, false, NULL, 989.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (23005, 2, 2, false, false, false, 'Faulty lighting', 130.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (34001, 3, 2, false, true, false, 'Weak Wi-Fi signal', 130.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (34002, 3, 2, true, false, false, NULL, 520.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (34003, 3, 2, false, true, false, NULL, 265.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (34004, 3, 2, true, false, false, NULL, 999.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (34005, 3, 2, false, false, false, 'Uncomfortable bed', 140.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (45001, 4, 2, false, true, false, 'Broken TV', 140.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (45002, 4, 2, true, false, false, NULL, 530.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (45003, 4, 2, false, true, false, NULL, 275.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (45004, 4, 2, true, false, false, NULL, 119.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (45005, 4, 2, false, false, false, 'Musty smell in room', 150.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (56001, 5, 2, false, true, false, 'Noisy air conditioning', 150.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (56002, 5, 2, true, false, false, NULL, 540.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (56003, 5, 2, false, true, false, NULL, 285.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (56004, 5, 2, true, false, false, NULL, 129.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (56005, 5, 2, false, false, false, 'Dirty bathroom', 160.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (67001, 6, 2, false, true, false, 'Clogged sink', 160.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (67002, 6, 2, true, false, false, NULL, 550.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (67003, 6, 2, false, true, false, NULL, 295.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (67004, 6, 2, true, false, false, NULL, 139.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (67005, 6, 2, false, false, false, 'Unpleasant odor', 170.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (78001, 7, 2, false, true, false, 'Leaky faucet', 180.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (78002, 7, 2, true, false, false, NULL, 570.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (78003, 7, 2, false, true, false, NULL, 305.50, true, false, false, true, true, false, true, 1, false, true, false, true),
                 (78004, 7, 2, true, false, false, NULL, 179.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (78005, 7, 2, false, false, false, 'Dusty room', 190.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (89001, 8, 2, false, true, false, 'Broken window latch', 200.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (89002, 8, 2, true, false, false, NULL, 590.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (89003, 8, 2, false, true, false, NULL, 325.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (89004, 8, 2, true, false, false, NULL, 199.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (89005, 8, 2, false, false, false, 'Unsatisfactory cleanliness', 210.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (11001, 1, 3, false, true, false, 'Loud HVAC system', 150.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (11002, 1, 3, true, false, false, NULL, 250.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (11003, 1, 3, false, true, false, NULL, 180.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (11004, 1, 3, true, false, false, NULL, 450.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (11005, 1, 3, false, false, false, 'Stained carpet', 190.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (22001, 2, 3, false, true, false, 'Noisy neighbors', 130.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (22002, 2, 3, true, false, false, NULL, 220.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (22003, 2, 3, false, true, false, NULL, 150.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (22004, 2, 3, true, false, false, NULL, 480.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (22005, 2, 3, false, false, false, 'Uncomfortable bed', 160.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (33001, 3, 3, false, true, false, 'Poor ventilation', 170.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (33002, 3, 3, true, false, false, NULL, 270.00, false, true, true, true, true, true, false, 5, true, false, false, true),
                 (33003, 3, 3, false, true, false, NULL, 190.50, true, false, false, true, true, false, true, 2, false, true, false, true),
                 (33004, 3, 3, true, false, false, NULL, 510.99, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (33005, 3, 3, false, false, false, 'Cracked window', 200.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (44001, 4, 3, false, true, false, 'Unpleasant odor', 180.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (44002, 4, 3, true, false, false, NULL, 290.00, false, true, true, true, true, true, false, 5, true, false, false, true),
                 (44003, 4, 3, false, true, false, NULL, 200.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (44004, 4, 3, true, false, false, NULL, 540.99, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (44005, 4, 3, false, false, false, 'Dirty carpet', 210.50, true, true, false, false, true, false, true, 4, true, false, true, false),

                 (55001, 5, 3, false, true, false, 'Clogged drain', 190.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (55002, 5, 3, true, false, false, NULL, 300.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (55003, 5, 3, false, true, false, NULL, 210.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (55004, 5, 3, true, false, false, NULL, 560.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (55005, 5, 3, false, false, false, 'Leaky faucet', 220.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (66001, 6, 3, false, true, false, 'Faulty thermostat', 160.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (66002, 6, 3, true, false, false, NULL, 270.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (66003, 6, 3, false, true, false, NULL, 180.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (66004, 6, 3, true, false, false, NULL, 490.99, true, true, true, true, true, true, false, 4, true, false, true, false),
                 (66005, 6, 3, false, false, false, 'Broken window', 190.50, true, true, false, false, true, false, true, 5, true, false, true, false),

                 (77001, 7, 3, false, true, false, 'Stained carpet', 180.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (77002, 7, 3, true, false, false, NULL, 290.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (77003, 7, 3, false, true, false, NULL, 200.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (77004, 7, 3, true, false, false, NULL, 540.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (77005, 7, 3, false, false, false, 'Worn-out mattress', 210.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (88001, 8, 3, false, true, false, 'Dirty carpets', 220.50, true, true, true, true, true, true, false, 2, true, false, true, false),
                 (88002, 8, 3, true, false, false, NULL, 330.00, false, true, true, true, true, true, false, 3, true, false, false, true),
                 (88003, 8, 3, false, true, false, NULL, 240.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (88004, 8, 3, true, false, false, NULL, 580.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (88005, 8, 3, false, false, false, 'Leaking faucet', 250.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (11101, 1, 4, false, true, false, 'Broken window blind', 190.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (11102, 1, 4, true, false, false, NULL, 300.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (11103, 1, 4, false, true, false, NULL, 210.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (11104, 1, 4, true, false, false, NULL, 550.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (11105, 1, 4, false, false, false, 'Clogged sink', 220.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (22201, 2, 4, false, true, false, 'Stained walls', 200.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (22202, 2, 4, true, false, false, NULL, 310.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (22203, 2, 4, false, true, false, NULL, 220.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (22204, 2, 4, true, false, false, NULL, 560.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (22205, 2, 4, false, false, false, 'Noisy air conditioning', 230.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (33301, 3, 4, false, true, false, 'Worn-out carpet', 210.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (33302, 3, 4, true, false, false, NULL, 320.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (33303, 3, 4, false, true, false, NULL, 230.50, true, false, false, true, true, false, true, 3, false, true, false, true),
                 (33304, 3, 4, true, false, false, NULL, 570.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (33305, 3, 4, false, false, false, 'Leaking shower', 240.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (44401, 4, 4, false, true, false, 'Cracked tiles', 220.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (44402, 4, 4, true, false, false, NULL, 330.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (44403, 4, 4, false, true, false, NULL, 240.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (44404, 4, 4, true, false, false, NULL, 580.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (44405, 4, 4, false, false, false, 'Faulty thermostat', 250.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (55501, 5, 4, false, true, false, 'Dirty curtains', 230.50, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (55502, 5, 4, true, false, false, NULL, 340.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (55503, 5, 4, false, true, false, NULL, 250.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (55504, 5, 4, true, false, false, NULL, 590.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (55505, 5, 4, false, false, false, 'Broken door handle', 260.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (66601, 6, 4, false, true, false, 'Stained bed sheets', 240.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (66602, 6, 4, true, false, false, NULL, 350.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (66603, 6, 4, false, true, false, NULL, 260.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (66604, 6, 4, true, false, false, NULL, 600.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (66605, 6, 4, false, false, false, 'Musty smell', 270.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (77701, 7, 4, false, true, false, 'Noisy neighbors', 280.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (77702, 7, 4, true, false, false, NULL, 360.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (77703, 7, 4, false, true, false, NULL, 270.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (77704, 7, 4, true, false, false, NULL, 620.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (77705, 7, 4, false, false, false, 'Creaky floorboards', 290.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (88801, 8, 4, false, true, false, 'Weak WiFi signal', 300.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (88802, 8, 4, true, false, false, NULL, 370.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (88803, 8, 4, false, true, false, NULL, 280.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (88804, 8, 4, true, false, false, NULL, 640.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (88805, 8, 4, false, false, false, 'Stained carpet', 310.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (11111, 1, 5, false, true, false, 'Uncomfortable mattress', 320.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (11112, 1, 5, true, false, false, NULL, 380.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (11113, 1, 5, false, true, false, NULL, 290.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (11114, 1, 5, true, false, false, NULL, 660.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (11115, 1, 5, false, false, false, 'Broken bedside lamp', 330.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (22221, 2, 5, false, true, false, 'Noisy air conditioning', 340.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (22222, 2, 5, true, false, false, NULL, 390.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (22223, 2, 5, false, true, false, NULL, 300.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (22224, 2, 5, true, false, false, NULL, 680.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (22225, 2, 5, false, false, false, 'Leaky faucet', 350.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (33331, 3, 5, false, true, false, 'Bad odor', 360.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (33332, 3, 5, true, false, false, NULL, 400.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (33333, 3, 5, false, true, false, NULL, 310.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (33334, 3, 5, true, false, false, NULL, 700.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (33335, 3, 5, false, false, false, 'Dirty carpet', 370.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (44441, 4, 5, false, true, false, 'Faulty heating system', 380.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (44442, 4, 5, true, false, false, NULL, 420.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (44443, 4, 5, false, true, false, NULL, 320.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (44444, 4, 5, true, false, false, NULL, 720.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (44445, 4, 5, false, false, false, 'Worn-out carpet', 390.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (55551, 5, 5, false, true, false, 'Malfunctioning heating', 400.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (55552, 5, 5, true, false, false, NULL, 450.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (55553, 5, 5, false, true, false, NULL, 350.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (55554, 5, 5, true, false, false, NULL, 750.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (55555, 5, 5, false, false, false, 'Cracked window', 420.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (66661, 6, 5, false, true, false, 'Uncomfortable pillows', 410.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (66662, 6, 5, true, false, false, NULL, 470.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (66663, 6, 5, false, true, false, NULL, 380.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (66664, 6, 5, true, false, false, NULL, 770.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (66665, 6, 5, false, false, false, 'Stained carpet', 430.50, true, true, false, false, true, false, true, 1, true, false, true, false),

                 (77771, 7, 5, false, true, false, 'Weak Wi-Fi signal', 420.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (77772, 7, 5, true, false, false, NULL, 480.00, false, true, true, true, true, true, false, 4, true, false, false, true),
                 (77773, 7, 5, false, true, false, NULL, 390.50, true, false, false, true, true, false, true, 5, false, true, false, true),
                 (77774, 7, 5, true, false, false, NULL, 790.99, true, true, true, true, true, true, false, 1, true, false, true, false),
                 (77775, 7, 5, false, false, false, 'Uncomfortable bed', 440.50, true, true, false, false, true, false, true, 2, true, false, true, false),

                 (88881, 8, 5, false, true, false, 'Noisy air conditioner', 430.50, true, true, true, true, true, true, false, 3, true, false, true, false),
                 (88882, 8, 5, true, false, false, NULL, 490.00, false, true, true, true, true, true, false, 2, true, false, false, true),
                 (88883, 8, 5, false, true, false, NULL, 400.50, true, false, false, true, true, false, true, 4, false, true, false, true),
                 (88884, 8, 5, true, false, false, NULL, 810.99, true, true, true, true, true, true, false, 5, true, false, true, false),
                 (88885, 8, 5, false, false, false, 'Dirty walls', 450.50, true, true, false, false, true, false, true, 1, true, false, true, false);


--Table structure:Renting
CREATE TABLE Renting (
	Renting_ID NUMERIC(9,0) PRIMARY KEY CHECK (Renting_ID > 0),
    Date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5),
	Payment VARCHAR(50) NOT NULL
);

--sample rentings
INSERT INTO Renting (Renting_ID, Date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID, Payment)
VALUES
	(123456789, '2023-01-01', 'John', 'Doe', 'Smith', 10001, 1, 1, 'Credit Card'),
    (234567890, '2023-01-02', 'Jane', NULL, 'Johnson', 20002, 2, 2, 'Cash'),
    (345678901, '2023-01-03', 'Michael', 'James', 'Brown', 30003, 3, 3, 'Paypal'),
	(987654321, '2023-03-15', 'Emily', NULL, 'Taylor', 40025, 1, 1, 'Credit Card'),
	(543219876, '2023-03-18', 'David', 'Wilson', 'Anderson', 50023, 3, 2, 'Debit Card');


--Table structure: Booking
CREATE TABLE Booking(
	booking_ID NUMERIC(9,0) PRIMARY KEY CHECK (booking_ID > 0),
    booking_date DATE NOT NULL,
    Customer_first_name VARCHAR(50) NOT NULL,
    Customer_middle_name VARCHAR(50),
    Customer_last_name VARCHAR(50) NOT NULL,
    Room_number NUMERIC(5,0) CHECK (Room_number > 0),
    hotelID INT CHECK (hotelID > 0),
    hotelChainID INT CHECK (hotelChainID BETWEEN 1 AND 5),
	Payment VARCHAR(50) NOT NULL
);

--sample bookings
INSERT INTO Booking (booking_ID, booking_date, Customer_first_name, Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID, Payment)
VALUES
	(567891234, '2023-01-01', 'John', 'Doe', 'Smith', 10001, 1, 1, 'Credit Card'),
    (456789123, '2023-01-02', 'Jane', NULL, 'Johnson', 20002, 2, 2, 'Cash'),
    (345678912, '2023-01-03', 'Michael', 'James', 'Brown', 30003, 3, 3, 'Paypal'),
	(234567891, '2023-03-15', 'Emily', NULL, 'Taylor', 40025, 1, 1, 'Credit Card'),
	(678912345, '2023-03-18', 'David', 'Wilson', 'Anderson', 50023, 3, 2, 'Debit Card');


--Queries

--aggregation query
--find average room price
SELECT AVG(price) AS avg_room_price
FROM Room;

--nested query

--regular queries
--rooms with all the amenities
SELECT room_number
FROM Room
WHERE amenities_tv=true AND amenities_wifi=true AND amenities_air_con=true
AND amenities_fridge=true AND amenities_toiletries=true;

--rooms with price less than 500
SELECT room_number
FROM Room
WHERE price < 500.00;



--Modifications (triggers)

-- Trigger to ensure a room cannot be booked if it's already reserved for that specific date
CREATE OR REPLACE FUNCTION prevent_double_booking()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM Booking
        WHERE room_number = NEW.room_number
        AND booking_date = NEW.check_in_date
        AND booking_id <> NEW.booking_id -- Exclude current booking from check
    ) THEN
        RAISE EXCEPTION 'Room is already booked for the specified date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_booking_double_booking
BEFORE UPDATE ON Booking
FOR EACH ROW
EXECUTE FUNCTION prevent_double_booking();

-- Trigger to ensure a hotel cannot be inserted if its ID is null or its hotelChainID does not exists in hotelChain
CREATE OR REPLACE FUNCTION prevent_invalid_hotel()
RETURNS TRIGGER AS $$
BEGIN
    IF new.hotelID IS NULL THEN
	                RAISE EXCEPTION 'hotelID should not be null';
	END IF;

	IF Not Exists( SELECT 1 FROM hotelChain where hotelChainID = new.hotelChainID)THEN
	                RAISE EXCEPTION 'Hotel should be a part of already existing hotel chain';

    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

Create TRIGGER before_insert_hotel
Before INSERT ON Hotel
For EACH ROW
EXECUTE Function prevent_invalid_hotel();

--Trigger to ensure a hotel cannot be deleted if it has rented rooms
CREATE OR REPLACE FUNCTION prevent_hotel_deletion_if_renting()
RETURNS TRIGGER AS $$
BEGIN
	IF EXISTS (
		SELECT 1 FROM Renting
		WHERE hotelID = OLD.hotelID
	) THEN
		RAISE EXCEPTION 'Cannot delete hotel with rented rooms';
	END IF;
	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_delete_hotel_rented_rooms
BEFORE DELETE ON Hotel
FOR EACH ROW
EXECUTE FUNCTION prevent_hotel_deletion_if_renting();


--Indexes

CREATE INDEX idx_booking_date ON Booking (booking_date);
/*This index would be beneficial for queries that involve filtering or sorting bookings by date. For example, when retrieving bookings for a specific date range or when sorting bookings by date.
Accelerates queries such as finding available rooms for a given date, checking booking history for a particular date, or analyzing booking trends over time. */

--helps to quickly find out booking details for specific customer (will confirm with the TA the check_in_check_out schema and then implement this index)
--CREATE INDEX idx_customer_id ON Check_in_check_out(customer_ID);

--Index on hotelID in Room will accelerate queries that require filtering or joining rooms based on the hotel they belong to. Examples include:
--retrieving all rooms belonging to a specific hotel or joining Room with other tables based on its hotel
CREATE INDEX idx_hotelID_room ON Room (HotelID);


--Views
--View 1: Number of available rooms per area
CREATE VIEW AvailableRoomsPerArea AS
SELECT CONCAT(SPLIT_PART(h.street, ' ', 2), ', ', h.city) AS area,
       COUNT(DISTINCT r.Room_number) AS num_available_rooms
FROM Room r
JOIN Hotel h ON r.HotelID = h.hotelID AND h.hotelChainID=r.hotelChainID
WHERE r.Room_number NOT IN (
    SELECT Room_number FROM Renting
    UNION
    SELECT Room_number FROM Booking
)
GROUP BY area;


--View 2: Aggregated capacity of all the rooms in a specific hotel
CREATE VIEW RoomCapacity AS
SELECT hotelChainID, hotelID, SUM(guest_capacity) AS total_capacity
FROM Room
GROUP BY hotelChainID, hotelID;
