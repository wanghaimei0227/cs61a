.read data.sql


CREATE TABLE average_prices AS
  SELECT category as category, avg(MSRP) as average_price from products group by category;


create table best_deal as
  select name, min(MSRP/rating) as cost from products group by category;

CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) from inventory group by item;


CREATE TABLE shopping_list AS
  SELECT item, store from lowest_prices, best_deal where item = name;


CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) from stores as a, shopping_list as b where a.store = b.store;

