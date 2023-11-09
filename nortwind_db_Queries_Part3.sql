-- EXISTS / NOT EXISTS (mevcut mu?)

-- ürün fiyatı 20'den kücük olan tedarikçileri listeler
SELECT company_name from suppliers
WHERE EXISTS (SELECT product_name FROM products
			 WHERE suppliers.supplier_id = products.supplier_id
			 AND unit_price < 20)
			 
--***** ALTTAKİ SORGUYLA FARKINA BAK			 
SELECT company_name from suppliers
WHERE EXISTS (SELECT product_name FROM products
			 WHERE suppliers.supplier_id = products.supplier_id
			 AND unit_price != 20)
---***** NOT EXISTS
SELECT company_name from suppliers
WHERE NOT EXISTS (SELECT product_name FROM products
			 WHERE suppliers.supplier_id = products.supplier_id
			 AND unit_price = 20)

--'3/5/1998' ile 4/5/1998 tarihleri arasında sipariş almış çalışanları listele ***********
SELECT first_name,last_name FROM employees
WHERE EXISTS (SELECT order_date FROM orders
			 WHERE employees.employee_id = orders.employee_id
			 AND order_date between '3/5/1998' AND '4/5/1998')

-- ALL => mantıksal operatörlerden biri
-- Tüm alt sorgu değerleri koşulu sağlıyorsa => TRUE

SELECT product_name FROM products
WHERE product_id = ALL(SELECT product_id FROM order_details
					  WHERE quantity=10)

-- ANY
-- Alt sorgu değerlerinde herhangi biri koşulu sağlıyorsa => TRUE
SELECT product_name FROM products
WHERE product_id = ANY(SELECT product_id FROM order_details
					  WHERE quantity>99)

--3 numaralı ID ye sahip çalışan son ocak ayıdan bugüne toplamda nekadarlık ürün sattı? **** (DATE_PART FONK. KULLANIMI)
SELECT SUM (quantity) FROM orders o 
INNER JOIN order_details od on o.order_id = od.order_id
WHERE o.employee_id = 3 
AND date_part('year',o.order_date) >=1998
AND date_part('month',o.order_date) >=1

--****** TRANSLATE KULLANIMI => (degisilecek sütun, 'nelerin değişeceği', 'neyle degiseceği') toplu değiştirmek için kullanılır
SELECT o.order_date, c.contact_name, translate(phone, '()-. ','') AS telephone 
FROM orders o 
INNER JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_date BETWEEN '1997-01-01' AND '1997-12-31' 
ORDER BY c.contact_name