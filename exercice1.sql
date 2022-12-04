/*- Select the names of all the products in the store.*/
SELECT name from "products";
/*- Select the names and the price of all the products in the store.*/
SELECT name , price  from "products";
/*- Select the name of the products with a price less than or equal to $200.*/
SELECT name , price  from "products" where price <= 200;
/*- Select all the products with a price between $60 and $120.*/
SELECT name , price  from "products" where price >  60  AND  price < 120 ;
/*- Select the name and price in cents (i.e., the price must be multiplied by 100).*/
SELECT name , price * 100 as price  from "products";
/*- *Compute the average price of all the products.*/
SELECT AVG(price) as price from "products";
/*- *Compute the average price of all products with manufacturer code equal to 2.*/
SELECT AVG(price) as price , manufacturer  from "products" where manufacturer=2 GROUP BY manufacturer;
/*- *Compute the number of products with a price larger than or equal to $180.*/
SELECT COUNT(price) FROM "products" where price >=180;
/*- Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).*/
SELECT name , price  FROM "products" where price >=180 ORDER BY price DESC, name ASC;
/*- Select all the data from the products, including all the data for each product's manufacturer.*/
SELECT * from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code;
/*- Select the product name, price, and manufacturer name of all the products.*/
SELECT products.name as products , price , manufacturers.name as manufacturers  from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code;
/*- Select the average price of each manufacturer's products, showing only the manufacturer's code.*/
SELECT AVG(price) as price  , manufacturers.code  from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code GROUP BY manufacturers.code;
/*- Select the average price of each manufacturer's products, showing the manufacturer's name.*/
SELECT AVG(price) as price  , manufacturers.name  from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code GROUP BY manufacturers.code;
/*- Select the names of manufacturer whose products have an average price larger than or equal to $150.*/
SELECT AVG(price) as price , manufacturers.name  from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code where price >= 150  GROUP BY manufacturers.code;
/*- Select the name and price of the cheapest product.*/
SELECT name , price  FROM "products" where price= (select MIN(price) from "products");
/*- Select the name of each manufacturer along with the name and price of its most expensive product.*/
SELECT products.name , products.price  , manufacturers.name  from "products" INNER JOIN manufacturers ON manufacturer=manufacturers.code where price=(select MAX(price) from "products" where manufacturers.code= manufacturer) GROUP BY products.name , products.price,  manufacturers.code;
/*- Add a new product: Loudspeakers, $70, manufacturer 2.*/
INSERT INTO products(code , name , price , manufacturer)VALUES(11 ,'Loudspeakers', 70, 2);
/*- Update the name of product 8 to "Laser Printer".*/
UPDATE products SET name = 'Laser Printer' , price= 8 where code=11;
/*- Apply a 10% discount to all products.*/
SELECT (price -  products.price * 10 / 100 ) as price from "products";
/*- *Apply a 10% discount to all products with a price larger than or equal to $120.*/
SELECT (price -  products.price * 10 / 100 ) as price from "products" where price >= 120;