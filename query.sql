/*CREATE DATABASE shop;
GO*/

USE shop;


/*
CREATE TABLE Buyer(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(15) DEFAULT 'unknown' NOT NULL,
Sex CHAR DEFAULT 'm' CHECK(Sex = 'm' OR Sex = 'w') NOT NULL,
Age INT DEFAULT 18 CHECK(Age > 0 AND Age < 80) NOT NULL,
);

CREATE TABLE Product(
Id INT PRIMARY KEY IDENTITY,
ProductName NVARCHAR(30) DEFAULT 'unknown' NOT NULL,
BuyerId INT,
Manufacturer NVARCHAR(50) DEFAULT 'unknown' NOT NULL,
ProduceDate DATE CHECK(ProduceDate > '2017/01/10' AND ProduceDate <= '2017/11/10') NOT NULL,
ProductWeight FLOAT DEFAULT 0.1 CHECK(ProductWeight > 0) NOT NULL,
Cost SMALLMONEY DEFAULT 1 CHECK(Cost > 0) NOT NULL,
FOREIGN KEY (BuyerId) REFERENCES Buyer(Id) ON DELETE CASCADE
);


INSERT Buyer 
VALUES
('Oleg','m', 30),
('Kolya','m', 20),
('Nastya','w', 25),
('Olya','w', 19),
('Nikita','m', 22),
('Vitya','m', 25)

INSERT Product 
VALUES
('Bread', (Select Id FROM Buyer WHERE FirstName = 'Oleg'), 'BulkiYBabulki', '2017-11-10', 0.5, 0.95),
('Milk', (Select Id FROM Buyer WHERE FirstName = 'Olya'), 'GlubokskiMKK', '2017-11-05', 1.0, 1.64),
('Meat', (Select Id FROM Buyer WHERE FirstName = 'Nikita'), 'FRESHMEAT', '2017-11-03', 1.0, 3.95),
('Beer', (Select Id FROM Buyer WHERE FirstName = 'Oleg'), 'Xmelnov.inc', '2017-11-01', 2.0, 2.19),
('Vodka', (Select Id FROM Buyer WHERE FirstName = 'Nastya'), 'Vodka.by', '2017-07-23', 0.5, 7.60),
('Lemon', (Select Id FROM Buyer WHERE FirstName = 'Kolya'), 'Ukraine', '2017-05-04', 1, 3.75),
('Butter', (Select Id FROM Buyer WHERE FirstName = 'Vitya'), 'Savushkin Product', '2017-11-07', 0.25, 0.60)


*/
SELECT *, Cost/ProductWeight AS 'Cost Per Killo' FROM Product ORDER BY 'Cost Per Killo';	

SELECT Age, COUNT(Age) AS 'Number of people'
FROM Buyer
GROUP BY Age 
HAVING Age > 20	


SELECT Buyer.FirstName, Product.ProductName, Product.Manufacturer, Product.ProduceDate, Product.ProductWeight, Product.Cost FROM Buyer, Product
WHERE Product.BuyerId = Buyer.Id
ORDER BY Buyer.FirstName	

SELECT Buyer.FirstName, Product.ProductName, Product.Cost 
FROM Buyer
INNER JOIN Product
ON Buyer.Id = Product.BuyerId
ORDER BY Buyer.FirstName