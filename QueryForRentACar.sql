create database RentACar

use RentACar

create table TypesOfVehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	TypeOfVehicle nvarchar(100) NOT NULL
)

create table Brands(
	Id int IDENTITY(1,1) PRIMARY KEY,
	BrandName nvarchar(100) NOT NULL
)

create table Classes(
	Id int IDENTITY(1,1) PRIMARY KEY,
	ClassName nvarchar(100) NOT NULL,
	ClassWinterPrice int NOT NULL,
	ClassSummerPrice int NOT NULL
)

create table Models(
	Id int IDENTITY(1,1) PRIMARY KEY,
	TypeOfVehicleId int FOREIGN KEY REFERENCES TypesOfVehicles(Id) NOT NULL,
	ClassId int FOREIGN KEY REFERENCES Classes(Id) NOT NULL,
	BrandId int FOREIGN KEY REFERENCES Brands(Id) NOT NULL,
	ModelName nvarchar(100) NOT NULL,
)

create table Vehicles(
	Id int IDENTITY(1,1) PRIMARY KEY,
	ModelId int FOREIGN KEY REFERENCES Models(Id) NOT NULL,
	Color nvarchar(100) NOT NULL,
	Mileage int,
	Registration nvarchar(100) NOT NULL
)

create table Registrations(
	Id int IDENTITY(1,1) PRIMARY KEY,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
	RegistrationDate datetime2 NOT NULL,
)

create table Employees(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Oib nvarchar(100) UNIQUE NOT NULL
)

create table Rents(
	Id int IDENTITY(1,1) PRIMARY KEY,
	VehicleId int FOREIGN KEY REFERENCES Vehicles(Id) NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	BuyerFirstName nvarchar(100) NOT NULL,
	BuyerLastName nvarchar(100) NOT NULL,
	BuyerOib nvarchar(100) NOT NULL,
	BuyerDateOfBirth datetime2 NOT NULL,
	BuyerLicenseNumber nvarchar(100) NOT NULL,
	BuyerCreditCardNumber nvarchar(100) NOT NULL,
	StartTime datetime2 NOT NULL,
	Duration float CHECK(Duration >= 1) NOT NULL,
)

