-- Automotive Parts Pricing SQL Project
-- Sanitized sample database for customer part numbers and 2026 pricing

DROP VIEW IF EXISTS piston_rings_view;
DROP TABLE IF EXISTS piston_rings;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE piston_rings (
    part_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    customer_part_number VARCHAR(50) UNIQUE NOT NULL,
    company_part_number VARCHAR(50),
    model VARCHAR(10),
    description VARCHAR(255),
    price_2026 NUMERIC(10,4)
);

INSERT INTO customers (customer_name)
VALUES
    ('A_Customer'),
    ('B_Customer'),
    ('C_Customer');

INSERT INTO piston_rings (
    customer_id,
    customer_part_number,
    company_part_number,
    model,
    description,
    price_2026
)
VALUES
    (1, 'A_part_number_1', 'ABC_part_1', 'Model_1', 'Piston ring sample description', 0.2565),
    (1, 'A_part_number_2', 'ABC_part_2', 'Model_1', 'Piston ring sample description', 0.4250),
    (1, 'A_part_number_3', 'ABC_part_3', 'Model_2', 'Piston ring sample description', 0.5950),
    (2, 'B_part_number_1', 'ABC_part_4', 'Model_3', 'Piston ring sample description', 0.6516),
    (2, 'B_part_number_2', 'ABC_part_5', 'Model_3', 'Piston ring sample description', 0.4500),
    (2, 'B_part_number_3', 'ABC_part_6', 'Model_4', 'Piston ring sample description', 0.5100),
    (2, 'B_part_number_4', 'ABC_part_7', 'Model_4', 'Piston ring sample description', 1.6450),
    (2, 'B_part_number_5', 'ABC_part_8', 'Model_5', 'Piston ring sample description', 0.4500),
    (2, 'B_part_number_6', 'ABC_part_9', 'Model_5', 'Piston ring sample description', 0.5500),
    (2, 'B_part_number_7', 'ABC_part_10', 'Model_6', 'Piston ring sample description', 0.6700),
    (2, 'B_part_number_8', 'ABC_part_11', 'Model_6', 'Piston ring sample description', 0.4850),
    (2, 'B_part_number_9', 'ABC_part_12', 'Model_7', 'Piston ring sample description', 0.5050),
    (3, 'C_part_number_1', 'ABC_part_13', 'Model_8', 'Piston ring sample description', 0.4180),
    (3, 'C_part_number_2', 'ABC_part_14', 'Model_8', 'Piston ring sample description', 0.3550),
    (3, 'C_part_number_3', 'ABC_part_15', 'Model_9', 'Piston ring sample description', 0.5000);

GO

CREATE VIEW piston_rings_view AS
SELECT
    c.customer_id,
    c.customer_name,
    p.part_id,
    p.customer_part_number,
    p.company_part_number,
    p.model,
    p.description,
    p.price_2026
FROM piston_rings p
JOIN customers c
    ON p.customer_id = c.customer_id;

GO

SELECT *
FROM customers
ORDER BY customer_id;

SELECT *
FROM piston_rings_view
ORDER BY customer_id, customer_part_number;

SELECT *
FROM customers
WHERE customer_name = 'A_Customer';

SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

SELECT *
FROM customers
WHERE customer_name LIKE 'A%'
   OR customer_name LIKE 'B%';

SELECT *
FROM customers
WHERE customer_name <> 'B_Customer';

SELECT
    c.customer_name,
    p.customer_part_number,
    p.company_part_number,
    p.model,
    p.description,
    p.price_2026
FROM piston_rings p
JOIN customers c
    ON p.customer_id = c.customer_id
ORDER BY c.customer_name, p.customer_part_number;

SELECT
    c.customer_name,
    COUNT(p.part_id) AS total_parts
FROM customers c
JOIN piston_rings p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_name
ORDER BY total_parts DESC;

SELECT
    c.customer_name,
    ROUND(AVG(p.price_2026), 4) AS average_price_2026
FROM customers c
JOIN piston_rings p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_name
ORDER BY average_price_2026 DESC;

SELECT
    customer_name,
    customer_part_number,
    company_part_number,
    model,
    price_2026
FROM piston_rings_view
ORDER BY price_2026 DESC;

SELECT
    customer_name,
    customer_part_number,
    company_part_number,
    model,
    price_2026
FROM piston_rings_view
WHERE price_2026 > 0.5000
ORDER BY price_2026 DESC;