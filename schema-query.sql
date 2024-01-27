CREATE DATABASE shopping_cart_db;

CREATE TABLE customer(
    customer_id INT,
    name VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(100),
    phone VARCHAR(10),
    PRIMARY KEY (customer_id),
);

CREATE TABLE product(
    product_id INT,
    name VARCHAR(100),
    price NUMERIC(8, 2),
    description VARCHAR(255),
    PRIMARY KEY (product_id),
);

CREATE TABLE acrt_order(
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(100),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
