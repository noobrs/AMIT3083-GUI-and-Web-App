CREATE TABLE Customer (
	CustomerID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	Name VARCHAR(100),
	Username VARCHAR(50),
	PhoneNumber VARCHAR(20),
	Email VARCHAR(100),
	Password VARCHAR(255),
	Status INTEGER,
	primary key(CustomerID)
);

CREATE TABLE Category (
	CategoryID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	CategoryName VARCHAR(80),
	Status INTEGER,
	primary key(CategoryID)
);

CREATE TABLE Staff (
	StaffID VARCHAR(5) not null primary key,
	Name VARCHAR(100),
	Password VARCHAR(255),
	Status INTEGER,
	Email VARCHAR(100)
);

CREATE TABLE Product (
	ProductID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	Name VARCHAR(100),
	Price DOUBLE,
	Stock INTEGER,
	Description VARCHAR(255),
	Image VARCHAR(100),
	Status INTEGER,
	CategoryID INTEGER not null,
	StaffID VARCHAR(5),
	primary key(ProductID),
	foreign key (CategoryID) references Category(CategoryID)
	
);

CREATE TABLE Promotion (
 	PromotionID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
        PromotionCode VARCHAR(100),
 	DiscountPercentage DOUBLE,
 	RedemptionQuantity INTEGER,
	Status INTEGER,	
        StaffID VARCHAR(5),
	primary key(PromotionID),
        foreign key (StaffID) references Staff(StaffID)
);

CREATE TABLE Orders(
 	OrderID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
 	OrderDateTime DATE,
 	ShippingAddress VARCHAR(255),
 	PaymentType VARCHAR(100),
 	Subtotal DOUBLE,
 	TotalDiscount DOUBLE,
	ShippingFee DOUBLE,
 	Total DOUBLE,
 	CustomerID INTEGER not null,
	primary key(OrderID),
	foreign key (CustomerID) references Customer(CustomerID)
);

CREATE TABLE ProductCart (
 	CustomerID INTEGER not null,
 	ProductID INTEGER not null,
 	Quantity INTEGER,
 	primary key(CustomerID,ProductID),
 	foreign key (CustomerID) references Customer(CustomerID),
 	foreign key (ProductID) references Product(ProductID)
);

CREATE TABLE ProductOrder (
 	OrderID INTEGER not null,
 	ProductID INTEGER not null,
 	Quantity INTEGER,
 	primary key(OrderID,ProductID),
 	foreign key (OrderID) references Orders(OrderID),
 	foreign key (ProductID) references Product(ProductID)
);
