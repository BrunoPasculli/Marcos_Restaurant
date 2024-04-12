CREATE SCHEMA marcos_restaurant;
USE marcos_restaurant;

CREATE TABLE menu (
	product_id INT NOT NULL,
    product_name VARCHAR(20),
    price INT,
    PRIMARY KEY (product_id)
);

INSERT INTO menu
	(product_id, product_name, price)
VALUES
	("1", "spaghetti", "20"),
    ("2", "ravioli", "30"),
    ("3", "canelloni", "40");

CREATE TABLE members (
	customer_id VARCHAR(4) NOT NULL,
    join_date TIMESTAMP,
    PRIMARY KEY (customer_id)
);

INSERT INTO members
	(customer_id, join_date)
VALUES 
	("A", "2024-03-06"),
    ("B", "2024-03-08");
    
CREATE TABLE sales (
		customer_id VARCHAR(4) NOT NULL,
        order_date DATE,
        product_id INTEGER NOT NULL
);

INSERT INTO sales
	(customer_id, order_date, product_id)
VALUES
	("A", "2024-03-01", "1"),
    ("A", "2024-03-01", "2"),
    ("A", "2024-03-06", "3"),
    ("A", "2024-03-08", "3"),
    ("A", "2024-03-01", "1"),
    ("A", "2024-03-01", "1"),
    ("B", "2024-03-01", "2"),
    ("B", "2024-03-02", "1"),
    ("B", "2024-03-07", "3"),
    ("C", "2024-03-01", "1"),
    ("C", "2024-03-01", "2"),
    ("C", "2024-03-07", "1");
