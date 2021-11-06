--1.a--
SELECT *
FROM dealer, client;

--1.b--
SELECT dealer.name, client.name, city, grade, sell.id as sell_number, date, amount
FROM dealer, client;

--1.c--
SELECT dealet.name, client.name
FROM dealer, client
WHERE  dealer.id = client.dealer_id AND dealer.location = client.city;

--1.d--
SELECT sell.id, amount, client.name, city
FROM client inner join sell on client.id = sell.client_id
WHERE amount BETWEEN 100 AND 500;

--1.e--


--1.f--
SELECT client.name, city, dealet.name, charge as comission
FROM dealer, client
WHERE dealer.id = client.dealer_id;

--1.g--
SELECT client.name, city, dealer.name, charge as commission
FROM dealer, client
WHERE dealer.id = client.dealer_id AND charge > 0.12;

--2.a--
CREATE VIEW unique_clients as
    SELECT count(DISTINCT client.id)
    FROM client;

CREATE VIEW purchase_amount(date, avg_amount, sum_amount) as
    SELECT date, avg(amount), sum(amount)
    FROM sell
    GROUP BY date
    ORDER BY date;

--2.b--
CREATE VIEW top_5 as
    SELECT *
    FROM (SELECT * FROM purchase_amount ORDER BY sum(amount) DESC )
    LIMIT 5;

--2.c--
CREATE VIEW dealer_sell as
    SELECT dealer.name, count(sell.id),avg(amount), sum(amount)
    FROM dealer inner join client c on dealer.id = sell.dealer_id
    GROUP BY dealer.id;

--2.d--
CREATE VIEW dealer_ern as
    SELECT location, sum(charge*amount)
    FROM dealer inner join sell on dealer.id = sell.dealer_id
    GROUP BY location;

--2.e--
CREATE VIEW sale_location as
    SELECT location, count(sell.id), avg(amount), sum(amount)
    FROM client inner join sell on client.id = sell.client_id
    GROUP BY city;

--2.f--
CREATE VIEW client_expense as
    SELECT city, count(sell.id),avg(amount), sum(amount)
    FROM client inner join sell on client.id = sell.client_id
    GROUP BY city;