--SQL => Structured Query Language
--Veri Sorgulama - Veri Manipülasyonu

--SELECT
--Select (kolonlar) from [tablo_adi]

Select * from products;
Select product_name, unit_price from products;

--WHERE
--'den 'dan anlamı katar sorguya
--filtreleme

SELECT * FROM products WHERE unit_price >50;
SELECT * FROM products WHERE unit_price >=50 AND unit_price <=100;
SELECT * FROM products WHERE unit_price BETWEEN 50 AND 100;
SELECT product_name,category_id,unit_price FROM products
WHERE unit_price >=50 OR category_id > 5 ;
SELECT * FROM products WHERE product_name = 'Chai' OR product_name = 'Chang' OR product_name = 'Ikura';
--IN()
--İçerisinde parametre olarak verilen n kadar veri ile ilgili alanın uyuşmasını bekler

SELECT * FROM products WHERE product_name IN('Chai','Chang','Ikura');
SELECT * FROM products
WHERE category_id IN(1,2,3);

--LIKE
--kalıba benzeyen ifadeleri getirir
-- LOWER tüm harfleri küçültür.

SELECT * FROM products
WHERE LOWER (product_name) LIKE 't%';

-- % => ilgili metnin sol ya da sağında eklendiğinde
-- sağ veye sol için metinden sonra gelecek metni önemsemiyorum.
-- İsminin içerisinde 't' harfi geçen tüm ürünleri getirir.

SELECT * FROM products
WHERE product_name LIKE '__r%';

-- _ => karakter atlama olarak geçer.

--BUILT - IN FUNCTIONS
--SUMMARY => TOPLAMA
SELECT SUM(unit_price) FROM products;

--AVERAGE => ORTALAMA
SELECT AVG (unit_price) FROM products;

-- MAXIMUM => Verilerim arasında maximum değeri döner
SELECT MAX (unit_price) FROM products;

-- MINIMUM => Verilerim arasında minimum değeri döner
SELECT MIN (unit_price) FROM products;

-- COUNT => Adet döndürür
SELECT COUNT(*) FROM products
WHERE unit_price >50;

--DISTINCT => Tekrarları engeller
-- Kaç farklı şehirden çalışanım var?
SELECT DISTINCT city FROM employees;

--SUB-QUERY - Alt sorgu
-- Ortalamanın altında bir fiyata sahip olan ürünlerimin bilgisini istiyorum.
SELECT AVG (unit_price) FROM products;

SELECT * FROM products
WHERE unit_price < 28.83;

SELECT * FROM products
WHERE unit_price < (SELECT AVG (unit_price) FROM products);

-- En pahalı ürünümün bilgilerini getirelim

SELECT MAX(unit_price) FROM products ;

SELECT * FROM products
WHERE unit_price = (SELECT MAX(unit_price) FROM products);

--ORDER BY => Sıralama
--Default olarak => Küçükten büyüğe sıralama
-- ASENDING => A(artan)SC => Küçükten büyüğe a-z / 1-9
-- DESCENDING => D(üşen)ECS => Büyükten küçüğe z-a 9-1

SELECT product_name,unit_price FROM products
ORDER BY unit_price ASC;

SELECT product_name,unit_price FROM products
ORDER BY unit_price DESC;

---

SELECT CURRENT_DATE AS "Bugünün Tarihi";
SELECT date_part('year', CURRENT_DATE);



