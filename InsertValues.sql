insert into TypesOfVehicles(TypeOfVehicle) values
	('Car'),
	('Motorcycle'),
	('Van')

insert into Brands(BrandName) values
	('BMW'),
	('Audi'),
	('Ferrari'),
	('Mitsubishi'),
	('Yamaha'),
	('Ducati'),
	('Piaggio'),
	('Renault'),
	('Fiat')

insert into Classes(ClassName, ClassWinterPrice, ClassSummerPrice) values
	('Luxury car', 1000, 1500),
	('Big city car', 500, 700),
	('Small city car', 300, 500),
	('Scooter', 100, 150),
	('Luxury motorbike', 500, 700),
	('Standard', 400, 500),
	('Commercial', 300, 400)

insert into Models(TypeOfVehicleId, ClassId, BrandId, ModelName) values
	(1, 1, 1, '530d'),
	(1, 1, 1, 'i8'),
	(1, 1, 1, '330d'),
	(1, 1, 1, 'X6'),
	(1, 3, 2, 'A1'),
	(1, 2, 2, 'A3'),
	(1, 2, 2, 'A6'),
	(1, 1, 3, '488'),
	(1, 3, 8, 'Clio'),
	(1, 2, 8, 'Megane'),
	(1, 3, 9, 'Punto'),
	(1, 2, 9, 'Tipo'),
	(2, 4, 7, 'Medley 150'),
	(2, 4, 5, 'X-MAX 300'),
	(2, 4, 5, 'T-MAX 500'),
	(2, 5, 5, '125 cc'),
	(2, 5, 6, 'monster 696'),
	(2, 5, 6, 'panigale v4'),
	(3, 6, 8, 'Grand Scenic'),
	(3, 6, 4, 'Delica'),
	(3, 7, 8, 'Trafic'),
	(3, 7, 8, 'Master'),
	(3, 7, 9, 'Doblo Cargo'),
	(3, 7, 9, 'Ducato')

insert into Vehicles(ModelId, Color, Mileage, Registration) values
	(1, 'blue', 10000, 'ST-234-LV'),
	(2, 'red', 5000, 'ST-234-AV'),
	(3, 'blue', 100, 'ST-234-EV'),
	(4, 'red', 500, 'ST-234-MM'),
	(5, 'yellow', 1234, 'ST-233-RV'),
	(6, 'green', 3000, 'ST-234-OO'),
	(7, 'black', 20000, 'ST-234-PV'),
	(8, 'red', 50000, 'ST-234-LB'),
	(9, 'red', 5000, 'ST-224-EV'),
	(10, 'black', 0, 'ST-234-AB'),
	(11, 'white', 5000, 'ST-234-AC'),
	(12, 'black', 120000, 'ST-234-LL'),
	(13, 'red', 53000, 'ST-234-TT'),
	(14, 'blue', 10000, 'ST-232-II'),
	(15, 'red', 25000, 'ST-111-AS'),
	(16, 'black', 10000, 'ST-111-AK'),
	(17, 'purple', 5000, 'ST-111-AP'),
	(18, 'green', 10000, 'ST-111-AO'),
	(19, 'red', 15000, 'ST-111-AN'),
	(20, 'black', 10000, 'ST-111-AA'),
	(21, 'red', 5000, 'ST-111-AC'),
	(22, 'white', 18000, 'ST-111-AZ'),
	(23, 'orange', 5000, 'ST-111-DD'),
	(24, 'yellow', 10000, 'ST-111-MM'),
	(1, 'red', 5550, 'ST-234-UU')

insert into Registrations(VehicleId, RegistrationDate) values
	(1, '2017-7-10'),
	(1, '2018-7-12'),
	(1, '2019-7-13'),
	(1, '2020-7-14'),
	(2, '2017-7-10'),
	(3, '2018-7-12'),
	(4, '2019-7-13'),
	(5, '2020-2-14'),
	(6, '2017-7-10'),
	(7, '2018-7-12'),
	(7, '2019-7-13'),
	(8, '2015-7-14'),
	(8, '2017-7-10'),
	(9, '2018-7-12'),
	(10, '2019-7-13'),
	(11, '2020-7-14'),
	(12, '2017-7-10'),
	(13, '2018-7-12'),
	(14, '2019-7-13'),
	(15, '2020-8-14'),
	(16, '2020-3-14'),
	(17, '2020-1-14'),
	(18, '2019-7-13'),
	(18, '2020-8-14'),
	(19, '2020-3-14'),
	(20, '2020-1-14'),
	(21, '2017-7-10'),
	(21, '2018-7-12'),
	(21, '2019-7-13'),
	(21, '2020-7-14'),
	(22, '2018-7-12'),
	(23, '2019-7-13'),
	(24, '2020-8-14'),
	(25, '2020-3-14')

insert into Employees(FirstName, LastName, Oib) values
	('Mate', 'Matic', '12345'),
	('Ante', 'Antic', '12346'),
	('Miho', 'Mihic', '12347'),
	('Petar', 'Peric', '12312'),
	('Luka', 'Mihic', '12112')

insert into Rents(VehicleId, EmployeeId, BuyerFirstName, BuyerLastName, BuyerOib, BuyerDateOfBirth, BuyerLicenseNumber, BuyerCreditCardNumber, StartTime, Duration) values
	(1, 1, 'Ana', 'Anic', '98765', '1998-2-02', '987', '789', '2020-9-29', 6.5),
	(2, 1, 'Mila', 'Milic', '98766', '1967-3-03', '988', '234', '2020-3-29', 6.5),
	(3, 1, 'Ivan', 'Ivanovic', '98762', '2000-7-11', '123', '456', '2020-2-29', 1.5),
	(4, 1, 'Marko', 'Matijevic', '78234', '1977-3-04', '122', '443', '2020-3-20', 1),
	(5, 1, 'Marko', 'Matijevic', '78234', '1977-3-04', '122', '443', '2020-1-03', 2),
	(6, 2, 'Marko', 'Matijevic', '78234', '1977-3-04', '122', '443', '2020-2-19', 3.5),
	(7, 2, 'Monika', 'Maretic', '78345', '1994-6-03', '567', '532', '2020-4-29', 2.5),
	(8, 2, 'Monika', 'Maretic', '78345', '1994-6-03', '567', '532', '2020-5-29', 6.5),
	(9, 3, 'Monika', 'Maretic', '78345', '1994-6-03', '567', '532', '2020-6-29', 2),
	(10, 3, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-7-20', 1),
	(11, 4, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-7-03', 22.5),
	(12, 4, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-8-19', 12),
	(13, 1, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2019-9-29', 6.5),
	(14, 1, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2019-3-20', 3.5),
	(15, 1, 'Ana', 'Anic', '98765', '1998-2-02', '987', '789', '2020-2-29', 4),
	(16, 1, 'Ana', 'Anic', '98765', '1998-2-02', '987', '789', '2020-3-20', 1),
	(20, 1, 'Ana', 'Anic', '98765', '1998-2-02', '987', '789', '2020-1-03', 2),
	(21, 2, 'Ivan', 'Ivanovic', '98762', '2000-7-11', '123', '456', '2020-2-19', 3.5),
	(22, 2, 'Ivan', 'Ivanovic', '98762', '2000-7-11', '123', '456', '2018-4-29', 2.5),
	(24, 2, 'Ivan', 'Ivanovic', '98762', '2000-7-11', '123', '456', '2019-5-29', 6.5),
	(1, 3, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-6-29', 2),
	(14, 3, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-7-20', 1),
	(12, 4, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-12-20', 22.5),
	(11, 4, 'Antonio', 'Juretic', '98712', '1990-10-02', '789', '777', '2020-12-25', 12)
