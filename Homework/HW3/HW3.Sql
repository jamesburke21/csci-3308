-- Priyanka Karki
-- CSCI 3308-201
-- HW #3

SELECT firstname, lastname FROM employees WHERE country != 'USA' AND  hiredate::date < date '2014-11-11' ORDER BY lastname;

SELECT productid, productname, unitsinstock, unitprice FROM products WHERE unitsinstock <= reorderlevel AND unitsinstock > 0;

SELECT productname, unitprice from products WHERE unitprice = (SELECT min(unitprice) FROM products) OR unitprice = (SELECT max(unitprice) FROM products);

SELECT productid as "Product ID", productname as "Produuct Name", (unitprice*unitsinstock) as "Total Inventory Value" FROM products WHERE (unitprice*unitsinstock) > 1000 ORDER BY (unitprice*unitsinstock) DESC;

SELECT DISTINCT shipcountry, count(*)  FROM orders WHERE shipcountry != 'Germany' AND orderdate BETWEEN date '2013-10-01' AND date '2013-10-31' group by shipcountry;

SELECT customerid, shipname, count(*) as order_count FROM orders group by customerid, shipname having count(*) >= 10;

SELECT supplierid, sum(unitprice*unitsinstock) from products GROUP BY supplierid HAVING count(supplierid) >= 5;

SELECT suppliers.companyname, products.productname, products.unitprice FROM suppliers, products WHERE suppliers.country = 'USA' OR suppliers.country='Germany' ORDER BY products.unitprice DESC;

SELECT employees.lastname, employees.firstname, employees.title, employees.extension, count(*) FROM orders, employees GROUP BY employees.lastname, employees.firstname, employees.title, employees.extension, orders.employeeid,employees.employeeid HAVING count(*) > 50 AND orders.employeeid = employees.employeeid;

SELECT customers.customerid, customers.companyname FROM customers LEFT JOIN Orders ON customers.customerid = orders.customerid WHERE orders.customerid IS NULL;

SELECT suppliers.companyname, suppliers.contactname, categories.categoryname, categories.description, products.productname, products.unitsonorder FROM suppliers, categories, products WHERE products.unitsinstock = 0 AND suppliers.supplierid=products.supplierid AND categories.categoryid = products.categoryid;

SELECT distinct on (products.productname) products.productname, suppliers.companyname, suppliers.country, products.unitsinstock FROM products, suppliers WHERE products.quantityperunit LIKE '%bags%' OR products.quantityperunit LIKE '%bottles%';

CREATE TABLE public.Top_Items
(
  ItemID integer NOT NULL,
  ItemCode integer NOT NULL,
  ItemName varchar(40) NOT NULL,
  InventoryDate timestamp NOT NULL,
  SupplierID integer NOT NULL,
  ItemQuantity integer NOT NULL,
  ItemPrice decimal(9,2),
  PRIMARY KEY (ItemID)
);

INSERT INTO Top_Items (ItemID, ItemCode, ItemName, InventoryDate, SupplierID, ItemQuantity, ItemPrice) SELECT products.productid, products.categoryid, products.productname, current_timestamp, products.supplierid, products.unitsinstock, products.unitprice FROM products WHERE (products.unitprice * products.unitsinstock) > 1500;

DELETE FROM Top_Items USING suppliers WHERE Top_Items.SupplierID = suppliers.supplierid AND (suppliers.country = 'USA' OR suppliers.country = 'Canada');

ALTER TABLE Top_Items ADD COLUMN InventoryValue decimal(9,2);

UPDATE Top_Items SET InventoryValue = ItemPrice*ItemQuantity;

DROP_Table Top_Items;