use chinook;

-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - Objective Questions - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - -


-- Q1. Does any table have missing values or duplicates? If yes how would you handle it ?    
 
SELECT 
	SUM(CASE WHEN invoice_line_id IS NULL THEN 1 ELSE 0 END) invoice_line_id_nulls,
    SUM(CASE WHEN invoice_id IS NULL THEN 1 ELSE 0 END) invoice_id_nulls,
    SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) track_id_nulls,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) unit_price_nulls,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) quantity_nulls
FROM 
	invoice_line;

SELECT 
	album_id,
    COUNT(*)
FROM
	album
GROUP BY
	album_id
HAVING 
	COUNT(*) > 1;
-- NO duplicates
-- NO null values


SELECT 
	SUM(CASE WHEN artist_id IS NULL THEN 1 ELSE 0 END) artist_id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) name_nulls
FROM 
	artist;
    
SELECT 
	artist_id,
    COUNT(*)
FROM 
	artist
GROUP BY
	artist_id
HAVING 
	COUNT(*) > 1;
-- NO duplicates
-- NO null values
    
SELECT 
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) cust_id_nulls,
	SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) cust_id_nulls,
	SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) first_name_nulls,
    SUM(CASE WHEN company IS NULL THEN 1 ELSE 0 END) company_nulls,
    SUM(CASE WHEN address IS NULL THEN 1 ELSE 0 END) address_nulls,
	SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) city_nulls,
	SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) state_nulls,
	SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) country_nulls,
    SUM(CASE WHEN postal_code IS NULL THEN 1 ELSE 0 END) postal_code,
	SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) phone_nulls,
    SUM(CASE WHEN fax IS NULL THEN 1 ELSE 0 END) fax_nulls,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) email_nulls,
    SUM(CASE WHEN support_rep_id IS NULL THEN 1 ELSE 0 END) support_rep_id
FROM 
	customer;

WITH cust_id_null AS (
    SELECT 
        customer_id
    FROM 
        customer
    WHERE 
        company = "NA" OR state = "NA" OR postal_code = "NA" OR fax = "NA"
) 

UPDATE customer
SET 
    company = "Unknown", 
    state = "Unknown", 
    postal_code = "Unknown", 
    fax = "Unknown"
WHERE 
    customer_id IN (SELECT customer_id FROM cust_id_null)
    AND (company = "NA" OR state = "NA" OR postal_code = "NA" OR fax = "NA");

SELECT 
	customer_id,
    COUNT(customer_id)
FROM 
	customer
GROUP BY 
	customer_id
HAVING 
	COUNT(*) > 1;
    
SELECT * FROM customer;
-- NO duplicate values
-- Multiple null values in multiple columns

SELECT 
	SUM(CASE WHEN employee_id IS NULL THEN 1 ELSE 0 END) employee_id_nulls,
	SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) first_name_nulls,
	SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) last_name_nulls,
	SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) title_nulls,
    SUM(CASE WHEN reports_to IS NULL THEN 1 ELSE 0 END) reports_to_nulls,
    SUM(CASE WHEN birthdate IS NULL THEN 1 ELSE 0 END) birthdate_nulls,
    SUM(CASE WHEN hire_date IS NULL THEN 1 ELSE 0 END) hire_date_nulls,
    SUM(CASE WHEN address IS NULL THEN 1 ELSE 0 END) address_nulls,
	SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) city_nulls,
	SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) state_nulls,
	SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) country_nulls,
    SUM(CASE WHEN postal_code IS NULL THEN 1 ELSE 0 END) postal_code,
	SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) phone_nulls,
    SUM(CASE WHEN fax IS NULL THEN 1 ELSE 0 END) fax_nulls,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) email_nulls
FROM 
	employee;
    

    
SELECT 
	employee_id,
    COUNT(*)
FROM 
	employee
GROUP BY
	employee_id
HAVING 
	COUNT(*) > 1;
-- NO duplicate values
-- only one null values and in "reports_to" column
    
SELECT 
    SUM(CASE WHEN genre_id IS NULL THEN 1 ELSE 0 END) genre_id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) name_nulls
FROM 
	genre;
    
SELECT 
	genre_id,
    COUNT(*)
FROM
	genre
GROUP BY
	genre_id
HAVING 
	COUNT(*) > 1;
-- No duplicate values
-- NO null values
    
SELECT
    SUM(CASE WHEN invoice_id IS NULL THEN 1 ELSE 0 END) invoice_id_nulls,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) customer_id,
    SUM(CASE WHEN invoice_date IS NULL THEN 1 ELSE 0 END) invoice_date_nulls,
    SUM(CASE WHEN billing_address IS NULL THEN 1 ELSE 0 END) address_nulls,
    SUM(CASE WHEN billing_city IS NULL THEN 1 ELSE 0 END) billing_city_nulls,
    SUM(CASE WHEN billing_state IS NULL THEN 1 ELSE 0 END) billing_state_nulls,
    SUM(CASE WHEN billing_country IS NULL THEN 1 ELSE 0 END) billing_country,
    SUM(CASE WHEN billing_postal_code IS NULL THEN 1 ELSE 0 END) billing_postal_code_nulls,
    SUM(CASE WHEN total IS NULL THEN 1 ELSE 0 END) total_nulls
FROM
	invoice;


SELECT * FROM album;
ALTER TABLE album
ADD ReleaseYear INT ;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.


SELECT 
	invoice_id,
    COUNT(*)
FROM 
	invoice
GROUP BY
	invoice_id
HAVING 
	COUNT(*) > 1;
-- NO duplicates
-- NO null values
    
    
SELECT 
    SUM(CASE WHEN invoice_line_id IS NULL THEN 1 ELSE 0 END) invoice_line_id_nulls,
    SUM(CASE WHEN invoice_id IS NULL THEN 1 ELSE 0 END) invoice_id_nulls,
    SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) track_id_nulls,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) unit_price_nulls,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) quantity_nulls
FROM
	invoice_line;

SELECT
	invoice_line_id,
    COUNT(*)
FROM 
	invoice_line
GROUP BY 
	invoice_line_id
HAVING 	
	COUNT(*) > 1;
-- NO duplicate values
-- NO null values


SELECT 
    SUM(CASE WHEN media_type_id IS NULL THEN 1 ELSE 0 END) media_type_id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) name_nulls
FROM 
	media_type;

SELECT
	media_type_id,
    COUNT(*)
FROM
	media_type
GROUP BY
	media_type_id
HAVING 
	COUNT(*) > 1;
-- NO duplicates
-- NO null values

SELECT 
    SUM(CASE WHEN playlist_id IS NULL THEN 1 ELSE 0 END) playlist_id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) name_nulls
FROM
	playlist;
    
SELECT 
	playlist_id,
    COUNT(*)
FROM 
	playlist
GROUP BY
	playlist_id
HAVING
	COUNT(*) > 1;
-- NO duplicate values
-- NO null values

SELECT 
    SUM(CASE WHEN playlist_id IS NULL THEN 1 ELSE 0 END) playlist_id_nulls,
    SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) track_id_nulls
FROM
	playlist_track;

SELECT 
	playlist_id,
    COUNT(track_id)
FROM 
	playlist_track
GROUP BY 
	playlist_id
HAVING 
	COUNT(track_id) > 1;
-- NO null values

SELECT 
    SUM(CASE WHEN track_id IS NULL THEN 1 ELSE 0 END) track_id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) name_nulls,
    SUM(CASE WHEN album_id IS NULL THEN 1 ELSE 0 END) album_id_nulls,
    SUM(CASE WHEN media_type_id IS NULL THEN 1 ELSE 0 END) media_type_id_nulls,
    SUM(CASE WHEN genre_id IS NULL THEN 1 ELSE 0 END) genre_id_nulls,
    SUM(CASE WHEN composer IS NULL THEN 1 ELSE 0 END) composer_nulls,
    SUM(CASE WHEN milliseconds IS NULL THEN 1 ELSE 0 END) milliseconds_nulls,
    SUM(CASE WHEN bytes IS NULL THEN 1 ELSE 0 END) bytes_nulls,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) unit_price_nulls
FROM
	track;
    
SELECT 
	track_id,
    COUNT(*)
FROM 
	track
GROUP BY 
	track_id,
    name
HAVING COUNT(*) > 1;
-- NO duplicates 
-- only composer column has 978-null values

    
WITH track_id_nulls AS (
    SELECT 
        t.track_id,
        t.album_id,
        a.artist_id,
        ar.name AS artist_name
    FROM 
        track t
    JOIN album a ON a.album_id = t.album_id
    JOIN artist ar ON ar.artist_id = a.artist_id
    WHERE
        t.composer IS NULL
)

SELECT * FROM track_id_nulls;

-- Create a temporary table to hold the IDs and new composer names
CREATE TEMPORARY TABLE track_id_nulls AS
SELECT 
    t.track_id,
    ar.name AS artist_name
FROM 
    track t
JOIN album a ON a.album_id = t.album_id
JOIN artist ar ON ar.artist_id = a.artist_id
WHERE
    t.composer IS NULL;


-- Drop the temporary table after the update
DROP TEMPORARY TABLE track_id_nulls;

SELECT * FROM track;
 	
-- Q2. Find the top-selling tracks and top artist in the USA and identify their most famous genres.

WITH t1 AS (
SELECT
	inl.track_id,
    SUM(inv.total) revenue
FROM 
	invoice_line inl
JOIN invoice inv ON inv.invoice_id = inl.invoice_id
WHERE 
	inv.billing_country = "USA"
GROUP BY 	
	inl.track_id
ORDER BY revenue DESC
LIMIT 10)

SELECT 
	t.name track_name,
	ar.name artist_name,
    g.name genre_name,
	revenue total_sales
FROM 
	artist ar
JOIN album al ON al.artist_id = ar.artist_id
JOIN track t ON t.album_id = al.album_id
JOIN genre g ON g.genre_id = t.genre_id
JOIN t1 ON t.track_id = t1.track_id
WHERE
	t.track_id IN (SELECT track_id FROM t1);

-- Q3 What is the customer demographic breakdown (age, gender, location) of Chinook's customer base?
SELECT 
	country,
	COUNT(customer_id) customer_count
FROM
	customer
GROUP BY
	1
ORDER BY
	customer_count DESC;

-- Q4 Calculate the total revenue and number of invoices for each country, state, and city:
SELECT
	DISTINCT billing_country,
    billing_state,
    billing_city,
	SUM(unit_price * quantity) OVER(PARTITION BY billing_country, billing_state ,billing_city) revenue,
    COUNT(il.invoice_id) OVER(PARTITION BY billing_country, billing_state ,billing_city) invoice_count
FROM
	invoice i 
JOIN invoice_line il ON i.invoice_id = il.invoice_id;

SELECT 
	billing_country,
    billing_state,
    billing_city,
    SUM(unit_price * quantity) total_revene,
    COUNT(i.invoice_id) invoices
FROM
	invoice i 
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
GROUP BY 1,2,3
ORDER BY 1,2,3;

-- Q5 Find the top 5 customers by total revenue in each country

WITH t1 AS(
SELECT 	
    billing_country,
    customer_id,
    SUM(unit_price * quantity) revenue
FROM
	 invoice i 
JOIN invoice_line il ON il.invoice_id = i.invoice_id
GROUP BY 
	1,2)
,
t2 AS(SELECT
	*,
	DENSE_RANK() OVER(PARTITION BY billing_country ORDER BY revenue DESC) rank_order
FROM 
	t1)
    
SELECT
	billing_country country,
	CONCAT(first_name," ",last_name) name,
    revenue
FROM 	
	t2
LEFT JOIN customer c ON t2.customer_id = c.customer_id
WHERE 
	rank_order <= 5
ORDER BY
	1;

-- Q6 Identify the top-selling track for each customer
        
WITH CustomerTrackPurchases AS (
    SELECT 
        i.customer_id,
        g.name genre_name,
        il.track_id,
        SUM(il.unit_price * il.quantity) AS total_purchase
    FROM invoice i 
    LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
	LEFT JOIN track t ON il.track_id = t.track_id
    LEFT JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY 
		1,2,3
),

RankedPurchases AS (
    SELECT
        customer_id,
        genre_name,
        track_id,
        total_purchase,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total_purchase DESC) AS rank_
    FROM
        CustomerTrackPurchases
)

SELECT
    customer_id,
    CONCAT(t.name," <-> ",genre_name) track_n_genre,
    total_purchase,
    COUNT(genre_name) OVER(PARTITION BY genre_name)/59 * 100 percent 
FROM
    RankedPurchases rp
RIGHT JOIN track t ON t.track_id = rp.track_id
WHERE
    rank_ = 1
ORDER BY
    customer_id;

    



-- Q7 Are there any patterns or trends in customer purchasing behavior (e.g., frequency of purchases, preferred payment methods, average order value)?

-- Avg money spent by each customer
SELECT customer_id, SUM(total) AS total_spent, AVG(total) AS avg_spent
FROM invoice
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Total purchase counts by each genre
SELECT g.name AS genre, COUNT(il.invoice_line_id) AS purchase_count
FROM invoice_line il
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name
ORDER BY purchase_count DESC;

-- Purchase count by each artist
SELECT 
	a.name AS artist, 
    COUNT(il.invoice_line_id) AS purchase_count
FROM invoice_line il
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN artist a ON al.artist_id = a.artist_id
GROUP BY a.name
HAVING COUNT(il.invoice_line_id) > 100
ORDER BY purchase_count DESC;
    
    
-- avg time period between the purchases
WITH purchase_dates AS
(SELECT
	DISTINCT customer_id,
	DATE_FORMAT(invoice_date,"%y-%m-%m") purchase_date
FROM invoice i
join invoice_line il ON i.invoice_id = il.invoice_id
ORDER BY 
	1),
    
next_dates AS (
SELECT
	customer_id,
    purchase_date,
    LEAD(purchase_date) OVER(PARTITION BY customer_id) next_date
FROM purchase_dates),

days_diff AS 
(SELECT 
	*,
	TIMESTAMPDIFF(month,purchase_date,next_date) difference_betw_each_purchase 
FROM next_dates)

SELECT 
	customer_id,
    AVG(difference_betw_each_purchase) avg_monthly_difference
FROM days_diff
GROUP BY 
	1;
    

-- Most purchased genre of each customer    
WITH t1 AS(
SELECT 
	CONCAT(first_name," ",last_name) Customer_name,
	g.name Genre_name,
    COUNT(t.track_id) Num_of_tracks
FROM
	invoice_line il
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN customer c ON i.customer_id = c.customer_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY 
	1,2
),
t2 AS 
(SELECT 
	*,
    DENSE_RANK() OVER(PARTITION BY customer_name ORDER BY Num_of_tracks DESC) rank_order
FROM
	t1)
    
SELECT
	Customer_name,
    Genre_name most_purchased_genre,
    Num_of_tracks
FROM
	t2
WHERE
	 rank_order = 1;
    
-- favorite artitst of customer
WITH artists AS 
(SELECT
	c.customer_id,
    CONCAT(first_name," ",last_name) customer_name,
    a.artist_id,
    a.name artist_name,
	COUNT(t.track_id) artist_count,
    SUM(quantity) track_purchased,
    AVG(total) avg_order_price
FROM artist a
JOIN album al ON a.artist_id = al.album_id
JOIN track t ON t.album_id = al.album_id
JOIN invoice_line il ON il.track_id = t.track_id
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN customer c ON i.customer_id = c.customer_id
GROUP BY 
	1,2,3,4
ORDER BY
	1,2,5 DESC),
    
t2 AS (
SELECT
	*,
    RANK() OVER(PARTITION BY customer_name ORDER BY artist_count DESC) rank_order
FROM 
	artists)

SELECT
	customer_id,
	customer_name,
    artist_id,
    artist_name,
    track_purchased,
    avg_order_price
FROM t2
WHERE rank_order = 1
ORDER BY
	2;

-- Most sold genre
SELECT 
    g.name genre_name,
    COUNT(customer_id) customer_count
FROM invoice_line il
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN genre g ON g.genre_id = t.genre_id
GROUP BY
	1
ORDER BY
	2 DESC;

-- Q8 What is the customer churn rate?

WITH first_three AS (
SELECT
	DATE_FORMAT(invoice_date,"%Y") year,
    COUNT(DISTINCT customer_id) first_three_months
FROM
	invoice
WHERE
	DATE_FORMAT(invoice_date,"%m") <=3
GROUP BY
	1),
    
last_three AS (
SELECT
	DATE_FORMAT(invoice_date,"%Y") year,
    COUNT(DISTINCT customer_id) last_three_months
FROM
	invoice
WHERE
	DATE_FORMAT(invoice_date,"%m") >= 10
GROUP BY
	1)
	
SELECT
	ft.year,
    first_three_months,
    last_three_months,
	ROUND((last_three_months - first_three_months)/first_three_months * 100,2) churn_rate
FROM first_three ft
JOIN last_three lt ON ft.year = lt.year;
	

-- Q9 Calculate the percentage of total sales contributed by each genre in the USA and identify the best-selling genres and artists.

WITH sales AS(
SELECT
	billing_country,
    g.name genre_name,
	SUM(il.unit_price * quantity) sales_per_genre
FROM artist a
JOIN album al ON a.artist_id = al.album_id
JOIN track t ON t.album_id = al.album_id
JOIN invoice_line il ON il.track_id = t.track_id
JOIN invoice i ON il.invoice_id = i.invoice_id
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY 
	1,2
ORDER BY 
	1,3 DESC),

total_sales AS (
SELECT
	SUM(sales_per_genre) summed_sales
FROM
	sales)

SELECT
	genre_name,
    sales_per_genre,
    ROUND((sales_per_genre / summed_sales) * 100,2) percentage_of_sales
FROM
	total_sales ts
JOIN sales s 
WHERE 
	billing_country = "USA";
    
    
-- Best selling artists and from each genre
WITH mst_sold AS 
(SELECT
	g.name genre_name,
    a.name artist_name,
    SUM(quantity) quantity_sold
FROM invoice i 
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
LEFT JOIN track t ON il.track_id = t.track_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
LEFT JOIN album al ON t.album_id = al.album_id
LEFT JOIN artist a ON al.artist_id = a.artist_id
WHERE i.billing_country = "USA"
GROUP BY 1,2
ORDER BY 1),

ranked AS 
(SELECT 
	*,
    RANK() OVER(PARTITION BY genre_name ORDER BY quantity_sold DESC) rank_ 
FROM mst_sold)

SELECT 
	genre_name,
    artist_name,
    quantity_sold
FROM ranked
WHERE rank_ = 1;

-- Q10 Find customers who have purchased tracks from at least 3 different genres
SELECT
	c.customer_id,
    COUNT(DISTINCT t.genre_id) genre_counts
FROM
	customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON il.track_id = t.track_id
GROUP BY 
	1
HAVING 
	genre_counts >= 3;
    
    
-- Q11 Rank genres based on their sales performance in the USA
WITH sales AS (
SELECT
	billing_country,
    g.name genre_name,
    SUM(il.unit_price * quantity) sales
FROM
	invoice i
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE billing_country = "USA"
GROUP BY 
	1,2),
    
ranked_genres AS (
SELECT
	billing_country country,
    genre_name,
    sales,
    RANK() OVER(PARTITION BY billing_country ORDER BY sales DESC) rank_order
FROM
	sales)
    
SELECT
	*
FROM 
	ranked_genres
ORDER BY	
	1;

-- Q12 Identify customers who have not made a purchase in the last 3 months
WITH last_purchase AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        MAX(i.invoice_date) AS last_invoice_date
    FROM
        customer c
        JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY
        c.customer_id
	HAVING 
		MAX(i.invoice_date) < "2020-10-1"
),

dates AS (SELECT
    lp.customer_id,
    lp.customer_name,
	DATE_FORMAT(lp.last_invoice_date,"%y-%m") last_purchase_date
FROM
    last_purchase lp)

SELECT
	last_purchase_date,
    customer_id
    -- COUNT(customer_id) customer_count
FROM
	dates;
    

-- ---------------------------------------------------------------- SUBJECTIVE QUESTIONS ---------------------------------------------------------------------


-- Q1 Recommend the three albums from the new record label that should be prioritised for advertising and promotion in the USA based on genre sales analysis.

WITH sales AS (
SELECT
	billing_country,
    g.name genre_name,
    al.title album_name,
    SUM(il.unit_price * quantity) sales
FROM
	invoice i
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON g.genre_id = t.genre_id
JOIN album al ON t.album_id = al.album_id
WHERE billing_country = "USA"
GROUP BY 
	1,2,3),
    
ranked_genres AS (
SELECT
    genre_name,
    album_name,
    sales,
    ROW_NUMBER() OVER(PARTITION BY genre_name ORDER BY sales DESC) rank_order
FROM
	sales)
    
SELECT
	genre_name,
    album_name,
    sales
FROM ranked_genres rg
WHERE rank_order = 1
ORDER BY 3 DESC;

-- Q2 Determine the top-selling genres in countries other than the USA and identify any commonalities or differences

WITH top_genres AS (
SELECT
	billing_country,
    g.name genre_name,
    SUM(il.unit_price * quantity) sales
FROM invoice i
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
RIGHT JOIN track t ON t.track_id = il.track_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
WHERE
	billing_country <> "USA"
GROUP BY 
	1,2
ORDER BY 
	1,3 DESC),
    
ranked AS (
SELECT 	
	*,
    DENSE_RANK() OVER(PARTITION BY billing_country ORDER BY sales DESC) rank_
FROM top_genres
)

SELECT
    genre_name,
    COUNT(genre_name) genre_counts
FROM ranked
WHERE rank_ <= 2
GROUP BY 
	1
ORDER BY 2 DESC;


-- Q3 Customer Purchasing Behavior Analysis: How do the purchasing habits (frequency, basket size, spending amount) 
-- of long-term customers differ from those of new customers? What insights can these patterns provide about customer loyalty and retention strategies?

WITH customer_purchases AS (
    SELECT
        customer_id,
        MIN(DATE_FORMAT(invoice_date,"%y-%m-%d")) first_purchase_date,
        MAX(DATE_FORMAT(invoice_date,"%y-%m-%d")) last_purchase_date,
        COUNT(DISTINCT invoice_id) purchases_made
    FROM
        invoice
    GROUP BY
        customer_id
),

customer_type AS (
    SELECT
        customer_id,
        CASE
            WHEN first_purchase_date < "17-03-30" AND purchases_made > (SELECT AVG(purchases_made) FROM customer_purchases) THEN 'Long-term'
            ELSE 'New'
        END AS customer_category
    FROM
        customer_purchases
),

purchasing_behaviour AS (
	SELECT 
		ct.customer_id,
        customer_category,
        COUNT(track_id) basket_size,
        SUM(unit_price * quantity) amount_spent
	FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    LEFT JOIN customer_type ct ON ct.customer_id = i.customer_id
    GROUP BY 
		1,2
)

SELECT * 
FROM purchasing_behaviour
;


-- Q4 Product Affinity Analysis: Which music genres, artists, or albums are frequently purchased together by customers?
-- How can this information guide product recommendations and cross-selling initiatives?

WITH customer_purchases AS(
SELECT 
	customer_id,
    g.name genre_name,
    al.title album_title,
    a.name artist_name,
    invoice_date
FROM invoice i 
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
LEFT JOIN track t ON il.track_id = t.track_id
LEFT JOIN album al ON t.album_id = al.album_id
LEFT JOIN artist a ON al.artist_id = a.artist_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
ORDER BY 
1,2,3),

customers AS (
SELECT 
    CONCAT(genre_name,"  ",album_title,"  ",artist_name) details,
    COUNT(DISTINCT invoice_date) frequency
FROM customer_purchases
GROUP BY 1
),

ranked AS (
SELECT 
	*,
    RANK() OVER(ORDER BY frequency DESC) rank_
FROM customers)

SELECT 
	details,
    frequency
FROM ranked
WHERE rank_ <= 10;


-- Q5 Regional Market Analysis: Do customer purchasing behaviors and churn rates vary across different geographic regions or store locations?
-- How might these correlate with local demographic or economic factors?

SELECT
	c.customer_id,
    c.country,
	c.postal_code,
	g.name genre_name,
    SUM(il.unit_price * quantity) sales,
    COUNT(DISTINCT il.track_id) basket_size,
    COUNT(DISTINCT invoice_date) frequency
FROM invoice i
LEFT JOIN customer c ON c.customer_id = i.customer_id
LEFT JOIN invoice_line il ON il.invoice_id = i.invoice_id
LEFT JOIN track t ON il.track_id = t.track_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
GROUP BY 
	1,2,3,4
ORDER BY 
	1,2;


-- Q6 Customer Risk Profiling: Based on customer profiles (age, gender, location, purchase history), which customer segments are more likely to churn or pose a higher risk
-- of reduced spending? What factors contribute to this risk?

WITH customers AS (
SELECT
	country,
    c.customer_id,
    SUM(il.unit_price * quantity) Total_amount_spent,
    COUNT(DISTINCT track_id) basket_size,
    MAX(invoice_date) last_purchase_date
FROM invoice i
LEFT JOIN customer c ON c.customer_id = i.customer_id
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
GROUP BY 
	1,2
ORDER BY 
	1),
    
avg_amount AS(
SELECT
	country,
    AVG(basket_size) avg_basket_size,
    AVG(Total_amount_spent) avg_amount_spent
FROM customers
GROUP BY 
	1)
    
SELECT 
	c.country,
	c.customer_id,
    basket_size,
    avg_basket_size,
    ROUND(Total_amount_spent,2) Total_amount_spent,
    ROUND(avg_amount_spent,2) avg_amount_spent,
    DATE_FORMAT(last_purchase_date, "%y-%m-%d") last_purchase_date
FROM avg_amount ag
LEFT JOIN customers c ON c.country = ag.country
WHERE 
	Total_amount_spent < avg_amount_spent AND
    basket_size < avg_basket_size AND
    last_purchase_date < "20-06-30";

-- Q7 Customer Lifetime Value Modeling: How can you leverage customer data (tenure, purchase history, engagement) 
-- to predict the lifetime value of different customer segments? This could inform targeted marketing and loyalty program strategies. 
-- Can you observe any common characteristics or purchase patterns among customers who have stopped purchasing?

WITH customer_category AS (
SELECT 
	customer_id,
    MAX(DATE_FORMAT(invoice_date,"%y-%m-%d")) last_purchase_date,
    COUNT(DISTINCT track_id) total_items
FROM invoice i 
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
GROUP BY 
	1
),

churned AS (
SELECT 
	customer_id,
    CASE WHEN last_purchase_date < "20-06-01"
         THEN "churned" ELSE "retained"
         END AS customer_type
FROM customer_category),

purchase_dates AS
(SELECT
	DISTINCT customer_id,
	DATE_FORMAT(invoice_date,"%y-%m-%m") purchase_date
FROM invoice i
join invoice_line il ON i.invoice_id = il.invoice_id
ORDER BY 
	1),
    
next_dates AS (
SELECT
	customer_id,
    purchase_date,
    LEAD(purchase_date) OVER(PARTITION BY customer_id) next_date
FROM purchase_dates),

days_diff AS 
(SELECT 
	*,
	TIMESTAMPDIFF(month,purchase_date,next_date) average_monthly_diff 
FROM next_dates),

behaviour AS (SELECT 
	ch.customer_id,
    customer_type,
    CASE WHEN LOWER(mt.name) LIKE "%audio%" THEN "audio"
		WHEN LOWER(mt.name) LIKE "%video%" THEN "video" 
        ELSE mt.name END AS media_type,
	g.name genre_name,
    AVG(il.unit_price * quantity) avg_amount_spent,
	COUNT(DISTINCT il.track_id) tracks_purchased,
    COUNT(DISTINCT invoice_date) frequency,
    RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(DISTINCT il.track_id) DESC) rank_
FROM churned ch
LEFT JOIN invoice i ON ch.customer_id = i.customer_id
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
LEFT JOIN track t ON il.track_id = t.track_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
LEFT JOIN media_type mt ON t.media_type_id = mt.media_type_id
GROUP BY 	
	1,2,3,4)
    
SELECT
	DISTINCT 
	b.customer_id,
    customer_type,
    genre_name,
    avg_amount_spent,
    tracks_purchased,
    AVG(average_monthly_diff) average_monthly_diff
FROM behaviour b
LEFT JOIN days_diff df ON b.customer_id = df.customer_id
WHERE rank_ = 1
GROUP BY 1,2,3,4,5
ORDER BY 2;
     
   
SELECT 
	*
FROM playlist
LIMIT 100;



WITH customer_activity AS (
    SELECT 
        c.customer_id,
        MAX(i.invoice_date) AS last_purchase_date,
        COUNT(DISTINCT i.invoice_id) AS purchase_count,
        AVG(i.total) AS avg_total_spent
    FROM 
        customer c
    LEFT JOIN 
        invoice i ON c.customer_id = i.customer_id
    GROUP BY 
        c.customer_id
),

churned AS (
    SELECT 
        customer_id,
        purchase_count,
        avg_total_spent,
        CASE 
            WHEN DATEDIFF('2021-01-01', last_purchase_date) > 180 THEN 'churned'
            ELSE 'retained'
        END AS customer_status
    FROM 
        customer_activity
)

SELECT 
    c.customer_id,
    customer_status,
    purchase_count,
    avg_total_spent
FROM 
    churned ch
JOIN 
    customer c ON ch.customer_id = c.customer_id
ORDER BY 4;


-- Q11 Chinook is interested in understanding the purchasing behavior of customers based on their geographical location. 
-- They want to know the average total amount spent by customers from each country, along with the number of customers 
-- and the average number of tracks purchased per customer. Write an SQL query to provide this information.

WITH cust_behaviour AS (
SELECT 
	billing_country,
    g.name genre_name,
    COUNT(DISTINCT il.track_id) avg_no_of_tracks,
    COUNT(DISTINCT customer_id) no_of_customers,
    SUM(total) total_amount_spent
FROM invoice i
LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
LEFT JOIN track t ON il.track_id = t.track_id
LEFT JOIN genre g ON t.genre_id = g.genre_id
GROUP BY
	1,2)
    
SELECT 
    billing_country,
    genre_name,
    avg_no_of_tracks,
    no_of_customers,
    total_amount_spent
FROM cust_behaviour
ORDER BY 1,2,3 DESC, 4 DESC;

WITH CustomerPurchases AS (
    SELECT 
        i.customer_id,
        i.billing_country,
        SUM(il.unit_price * il.quantity) AS total_spent,
        COUNT(DISTINCT il.track_id) AS total_tracks
    FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY i.customer_id, i.billing_country
)

SELECT 
    cp.billing_country AS country,
    COUNT(DISTINCT cp.customer_id) AS num_customers,
    ROUND(AVG(cp.total_spent),2) AS avg_total_spent_per_customer,
    ROUND(AVG(cp.total_tracks),2) AS avg_tracks_per_customer
FROM CustomerPurchases cp
GROUP BY cp.billing_country
ORDER BY num_customers DESC;


