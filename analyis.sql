CREATE DATABASE IF NOT EXISTS ecommerce_db
USE ecommerce_db
DROP TABLE IF EXISTS products
CREATE TABLE products (
    product_id VARCHAR(255) PRIMARY KEY, 
    product_name VARCHAR(255),
    category VARCHAR(255),
    discounted_price FLOAT,
    actual_price FLOAT,
    discount_percentage FLOAT,
    rating FLOAT,
    rating_count INT,
    about_product TEXT,
    user_id VARCHAR(255),   
    user_name VARCHAR(255),
    review_id VARCHAR(255),
    review_title TEXT,
    review_content TEXT,
    img_link TEXT,
    product_link TEXT,
    discount_amount FLOAT
);

INSERT INTO products (
    product_id, product_name, category, discounted_price, actual_price, 
    discount_percentage, rating, rating_count, about_product, 
    user_id, user_name, review_id, review_title, review_content, img_link, product_link,
    discount_amount
) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)

SELECT product_name, COUNT(review_id) AS total_reviews
FROM products
GROUP BY product_name
ORDER BY total_reviews DESC
LIMIT 10;

SELECT category, AVG(rating) AS avg_rating
FROM products
GROUP BY category
ORDER BY avg_rating DESC
LIMIT 1;

SELECT product_name, discount_percentage
FROM products
WHERE discount_percentage > 50
ORDER BY discount_percentage DESC;

SELECT user_name, COUNT(review_id) AS total_reviews
FROM products
GROUP BY user_name
ORDER BY total_reviews DESC
LIMIT 1;

SELECT category, COUNT(review_id) AS total_reviews
FROM products
GROUP BY category
ORDER BY total_reviews DESC
LIMIT 5;