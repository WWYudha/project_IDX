USE DWH_Project

CREATE TABLE DimCustomer (
	CustomerID int NOT NULL,
	CustomerName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHP varchar(50) NOT NULL,
	CONSTRAINT PKCustomer Primary Key (CustomerID));

CREATE TABLE DimProduct (
	ProductID int NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int NULL,
	CONSTRAINT PKProduct Primary Key (ProductID));

CREATE TABLE DimStatusOrder (
	StatusID int NOT NULL,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL,
	CONSTRAINT PKStatusOrder Primary Key (StatusID));

CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL,
	OrderDate date NOT NULL,
	CONSTRAINT PKSalesOrder Primary Key (OrderID),
	CONSTRAINT FKCustomer Foreign Key (CustomerID) References DimCustomer (CustomerID),
	CONSTRAINT FKProduct Foreign Key (ProductID) References DimProduct (ProductID),
	CONSTRAINT FKStatusOrder Foreign Key (StatusID) References DimStatusOrder (StatusID));
