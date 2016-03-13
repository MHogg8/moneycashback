DROP TABLE Merchants;
DROP TABLE Tags;
DROP TABLE Transactions;


CREATE TABLE Merchants(
  id serial8 primary key,
  name varchar(255)
);

CREATE TABLE Tags(
  id serial8 primary key,
  name varchar(255)
);

CREATE TABLE Transactions(
  id serial8 primary key,
  amount numeric,
  day date,
  description varchar(255),
  merchant_id INT8 references merchants(id),
  tag_id INT8 references tags(id)
);