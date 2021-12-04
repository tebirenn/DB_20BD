INSERT INTO store(id, name, city, street_name, street_number)
VALUES (1, 'Apple', 'Almaty', 'Abay', '12'),
       (2, 'Technodom', 'Almaty', 'Rayimbek batyr', '150'),
       (3, 'Mechta', 'Shymkent', 'Rozybakieva', '3'),
       (4, 'Samsung', 'Taraz', 'Tole bi', '59'),
       (5, 'Sulpak', 'Almaty', 'Turgut Ozal', '80'),

INSERT INTO customer(id, first_name, second_name, age, login, password, phone_number, credit_card_id, subs_id, city, street_name, street_number, store_id)
VALUES (1, 'Alan', 'Saudabekov', 19, 'youngdamn9', '123', '7702', 1, 1, 'Shymkent', 'Mustafayev', 14, 1),
       (2, 'Dimash', 'Saudabekov', 18, 'dimooon', '465136', '7702', 2, 2, 'Shymkent', 'Makatayev', 52, 1),
       (3, 'Abay', 'Saudabekov', 16, 'saudabek050', 'aka47', '7747', 3, 3, 'Shymkent', 'Rozybakieva', 23, 3)

INSERT INTO subscription(id, cost, discount)
VALUES (1, 2, 12),
       (2, 5, 15),
       (3, 10, 5)

INSERT INTO credit_card(id, producer, owner_name, owner_surname, date_of_issue, CVV)
VALUES (1, 'Kaspi', 'Alan', 'Saudabekov', '16-06-2016', '764'),
       (2, 'Kaspi', 'Dimash', 'Saudabekov', '09-03-2018', '654'),
       (3, 'Kaspi', 'Abay', 'Saudabekov', '23-12-2020', '318')

INSERT product(id, name, price, description, manufacturer, qty, category)
VALUES (1, 'Iphone 13', 500000, 'This is phone', 'Apple', 3, 'Smartphone'),
       (2, 'Samsung A51', 200000, 'This is phone', 'Samsung', 3, 'Smartphone'),
       (3, 'Macbook pro', 500000, 'M1', 'Apple', 3, 'Notebook')

INSERT INTO employee(id, first_name, second_name, age, phone_number, city, street_name, street_number)
VALUES (1, 'Dias', 'Kassym', 20, '7700', 'Almaty', 'pass', 45),
       (2, 'Nurai', 'Senalova', 19, '7777', 'Almaty', 'pass', 78),
       (3, 'Egor', 'Vladov', 21, '7747', 'Almaty', 'pass', 21)