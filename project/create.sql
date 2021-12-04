    CREATE TABLE store(
    id INT,
    PRIMARY KEY (id),
    store_name VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    street_name VARCHAR NOT NULL,
    street_number INT NOT NULL
);

CREATE TABLE subscription(
    id INT,
    PRIMARY KEY (id),
    cost INT,
    discount INT
);

CREATE TABLE credit_card(
    id INT,
    PRIMARY KEY (id),
    producer VARCHAR NOT NULL,
    owner_name VARCHAR NOT NULL,
    owner_surname VARCHAR NOT NULL,
    date_of_issue DATE,
    CVV INT UNIQUE
);

CREATE TABLE customer(
    id INT,
    PRIMARY KEY (id),
    fist_name VARCHAR(25) NOT NULL,
    second_name VARCHAR(25) NOT NULL,
    age INT NOT NULL,
    login VARCHAR(25) UNIQUE NOT NULL,
    password VARCHAR(25) NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
    credit_card_id INT,
    subs_id INT,
    FOREIGN KEY (credit_card_id) REFERENCES credit_card(id),
    FOREIGN KEY (subs_id) REFERENCES subscription(id),
    city VARCHAR(25),
    street_name VARCHAR(25),
    street_number INT NOT NULL,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(id)
);

CREATE TABLE has(
    customer_id INT references customer(id),
    credit_card_id INT references credit_card(id),
    PRIMARY KEY (customer_id, credit_card_id)
);

CREATE TABLE employee(
    id INT,
    PRIMARY KEY (id),
    first_name VARCHAR NOT NULL,
    second_name VARCHAR NOT NULL,
    age INT NOT NULL,
    phone_number VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    street_name VARCHAR NOT NULL,
    street_number INT NOT NULL
);

CREATE TABLE work_in(
    emp_id INT REFERENCES employee(id),
    store_id INT REFERENCES store(id),
    PRIMARY KEY (emp_id, store_id)
);

CREATE TABLE product(
    id INT,
    name VARCHAR NOT NULL,
    price INT NOT NULL,
    description VARCHAR NOT NULL,
    manufacturer VARCHAR NOT NULL,
    qty INT NOT NULL,
    category VARCHAR NOT NULL
);

CREATE TABLE takes(
    product_id INT REFERENCES product(id),
    order_id INT REFERENCES orders(id),
    PRIMARY KEY (product_id, order_id)
);

CREATE TABLE purchase(
    customer_id INT REFERENCES customer(id),
    store_id INT REFERENCES store(id),
    PRIMARY KEY (customer_id, store_id)
);

CREATE TABLE orders(
    id INT,
    store_id INT,
    customer_id INT,
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    total_price INT NOT NULL,
    payment_method VARCHAR NOT NULL,
    order_date DATE,
    order_location VARCHAR NOT NULL,
    order_address VARCHAR NOT NULL,
    status VARCHAR NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE delivery(
    id INT,
    PRIMARY KEY (id),
    service_name VARCHAR NOT NULL,
    delivery_address VARCHAR NOT NULL,
    price INT NOT NULL,
    sending_time TIME,
    arrival_time TIME,
    transport_id INT,
    FOREIGN KEY (transport_id) REFERENCES transport(id)
);

CREATE TABLE address(
    order_id INT REFERENCES orders(id),
    delivery_id INT REFERENCES delivery(id),
    PRIMARY KEY (order_id, delivery_id)
);

CREATE TABLE transport(
    id INT,
    PRIMARY KEY (id),
    transport_type VARCHAR NOT NULL
);

CREATE TABLE tracking(
    id INT,
    PRIMARY KEY (id),
    delivery_id INT,
    FOREIGN KEY (delivery_id) REFERENCES delivery(id),
    geolocation VARCHAR NOT NULL,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE used_on(
    tracking_id INT REFERENCES tracking(id),
    delivery_id INT REFERENCES delivery(id),
    PRIMARY KEY (tracking_id, delivery_id)
);

CREATE TABLE wholesale_store(
    id INT,
    PRIMARY KEY (id),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(id),
    city VARCHAR NOT NULL,
    street_name VARCHAR NOT NULL,
    street_number INT NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES wholesale_products(id)
);

CREATE TABLE wholesale_products(
    id INT,
    PRIMARY KEY (id),
    name VARCHAR NOT NULL,
    price INT NOT NULL,
    description VARCHAR,
    manufacturer VARCHAR NOT NULL,
    qty INT NOT NULL,
    category VARCHAR
);

CREATE TABLE take(
    store_id INT REFERENCES store(id),
    wholesale_store_id INT REFERENCES wholesale_store(id),
    PRIMARY KEY (store_id, wholesale_store_id)
);