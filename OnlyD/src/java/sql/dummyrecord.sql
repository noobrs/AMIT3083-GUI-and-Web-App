INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0000', 'Admin', 'adminpw01', 1, 'admin@gmail.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0001', 'John Doe', 'Aa@123123', 1, 'john_doe@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0002', 'Jane Smith', 'Aa@123456', 1, 'jane_smith@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0003', 'David Lee', 'Aa@123789', 1, 'david_lee@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0004', 'Emily Brown', 'Aa@123abc', 1, 'emily_brown@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0005', 'Michael Johnson', 'Aa@123def', 1, 'michael_johnson@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0006', 'Sarah Wilson', 'Aa@123ghi', 1, 'sarah_wilson@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0007', 'Daniel Taylor', 'Aa@123jkl', 1, 'daniel_taylor@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0008', 'Olivia Clark', 'Aa@123mno', 1, 'olivia_clark@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0009', 'James Martinez', 'Aa@123pqr', 1, 'james_martinez@example.com');
INSERT INTO Staff (StaffID, Name, Password, Status, Email) VALUES 
('S0010', 'Sophia Anderson', 'Aa@123stu', 1, 'sophia_anderson@example.com');

INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Jane Smith', 'jane_smith', '012-3456788', 'jane@example.com', 'Aa@123456', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('David Lee', 'david_lee', '012-3456787', 'david@example.com', 'Aa@123789', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Emily Brown', 'emily_brown', '012-3456786', 'emily@example.com', 'Aa@123abc', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Michael Johnson', 'michael_johnson', '012-3456785', 'michael@example.com', 'Aa@123def', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Sarah Wilson', 'sarah_wilson', '012-3456784', 'sarah@example.com', 'Aa@123ghi', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Daniel Taylor', 'daniel_taylor', '012-3456783', 'daniel@example.com', 'Aa@123jkl', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Olivia Clark', 'olivia_clark', '012-3456782', 'olivia@example.com', 'Aa@123mno', 1);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('James Martinez', 'james_martinez', '012-3456781', 'james@example.com', 'Aa@123pqr', 2);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('Sophia Anderson', 'sophia_anderson', '012-3456780', 'sophia@example.com', 'Aa@123stu', 2);
INSERT INTO Customer (Name, Username, PhoneNumber, Email, Password, Status) VALUES 
('John Doe', 'john_doe', '012-3456789', 'john@example.com', 'Aa@12345', 1);

INSERT INTO Category (CategoryName, Status) VALUES ('NULL', 1);
INSERT INTO Category (CategoryName, Status) VALUES ('Mouse', 1);
INSERT INTO Category (CategoryName, Status) VALUES ('Keyboard', 1);
INSERT INTO Category (CategoryName, Status) VALUES ('Headphone', 1);
INSERT INTO Category (CategoryName, Status) VALUES ('Monitor', 1);

INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES 
('Mouse1', 10.00, 20, 'Cheap and comfortable mouse', 'mouse_1.jpg', 1,  2, 'S0001');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Mouse2', 20.00, 20, 'RGB Gaming Mouse - Black', 'mouse_3.jpg', 1,  2, 'S0002');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Mouse3', 30.00, 20, 'RGB Gaming Mouse - White', 'mouse_4.jpg', 1,  2, 'S0003');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Keyboard1', 40.00, 20, 'RGB Backlit Mechanical Gaming Keyboard', 'keyboard_1.jpg', 1,  3, 'S0004');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Keyboard2', 50.00, 20, 'Wireless Keyboard', 'keyboard_2.jpg', 1,  3, 'S0005');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Keyboard3', 60.00, 20, 'Wired and wireless keyboard', 'keyboard_3.jpg', 1,  3, 'S0006');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Headphone1', 70.00, 20, 'Wireless Gaming Headset', 'headphone_1.jpg', 1,  4, 'S0007');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Headphone2', 80.00, 20, 'Noise Cancellation headphone', 'headphone_2.jpg', 1,  4, 'S0008');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Monitor1', 90.00, 20, 'Full HD LED Monitor', 'monitor_1.jpg', 1,  5, 'S0009');
INSERT INTO Product (Name, Price, Stock, Description, Image, Status,  CategoryID, StaffID) VALUES
('Monitor2', 100.00, 20, 'Curved Monitor', 'monitor_2.jpg', 1,  5, 'S0010');

INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(1, 1, 2);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(2, 3, 1);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(3, 5, 3);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(4, 2, 1);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(5, 4, 2);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(6, 6, 1);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(7, 8, 4);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(8, 9, 2);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(9, 10, 3);
INSERT INTO ProductCart (CustomerID, ProductID, Quantity) VALUES 
(10, 7, 1);

INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO001', 10.00, 100, 1, 'S0001');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO002', 15.00, 50, 1, 'S0002');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO003', 20.00, 75, 1, 'S0003');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO004', 25.00, 30, 1, 'S0004');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO005', 30.00, 60, 1, 'S0005');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO006', 5.00, 200, 1, 'S0006');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO007', 8.00, 150, 1, 'S0007');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO008', 12.00, 100, 1, 'S0008');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO009', 18.00, 80, 1, 'S0009');
INSERT INTO Promotion (PromotionCode, DiscountPercentage, RedemptionQuantity, Status, StaffID) VALUES 
('PROMO010', 22.00, 120, 1, 'S0010');

INSERT INTO Orders (OrderDateTime, ShippingAddress, PaymentType, Subtotal, TotalDiscount, ShippingFee, Total, CustomerID) VALUES 
('2023-05-01', '123 Jalan Tun Razak, Kuala Lumpur', 'Credit Card/Debit Card', 100.00, 10.00, 25.00, 115.00, 1);
INSERT INTO Orders (OrderDateTime, ShippingAddress, PaymentType, Subtotal, TotalDiscount, ShippingFee, Total, CustomerID) VALUES 
('2023-05-01', '456 Jalan Ampang, Ampang', 'Cash On Delivery', 80.00, 0.00, 25.00, 105.00, 2);
INSERT INTO Orders (OrderDateTime, ShippingAddress, PaymentType, Subtotal, TotalDiscount, ShippingFee, Total, CustomerID) VALUES 
('2023-06-03', '789 Jalan Bukit Bintang, Kuala Lumpur', 'Cash On Delivery', 300.00, 0.00, 0.00, 300.00, 3);
INSERT INTO Orders (OrderDateTime, ShippingAddress, PaymentType, Subtotal, TotalDiscount, ShippingFee, Total, CustomerID) VALUES 
('2023-06-04', '321 Jalan Klang Lama, Petaling Jaya', 'Credit Card/Debit Card', 200.00, 0.00, 25.00, 225.00, 4);
INSERT INTO Orders (OrderDateTime, ShippingAddress, PaymentType, Subtotal, TotalDiscount, ShippingFee, Total, CustomerID) VALUES 
('2023-09-05', '654 Jalan Sultan Ismail, Kuala Lumpur', 'Cash On Delivery', 250.00, 50.00, 0.00, 200.00, 5);

INSERT INTO ProductOrder (OrderID, ProductID, Quantity) VALUES 
(1, 1, 10);
INSERT INTO ProductOrder (OrderID, ProductID, Quantity) VALUES 
(2, 2, 4);
INSERT INTO ProductOrder (OrderID, ProductID, Quantity) VALUES 
(3, 3, 10);
INSERT INTO ProductOrder (OrderID, ProductID, Quantity) VALUES 
(4, 4, 5);
INSERT INTO ProductOrder (OrderID, ProductID, Quantity) VALUES 
(5, 5, 5);
