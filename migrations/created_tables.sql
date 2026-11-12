
CREATE DATABASE IF NOT EXISTS stock_tracker;
USE stock_tracker;


CREATE TABLE sectors (

id INTEGER PRIMARY KEY,
name VARCHAR (30) UNIQUE NOT NULL

);

CREATE TABLE exchanges (
id INTEGER PRIMARY KEY,
code VARCHAR (10) UNIQUE NOT NULL, 
name TEXT 
);

CREATE TABLE securities (
    id INTEGER PRIMARY KEY,
symbol VARCHAR (10) UNIQUE NOT NULL,
name TEXT NOT NULL,
exchange_id INTEGER NOT NULL,
sector_id INTEGER NOT NULL,
FOREIGN KEY (exchange_id) REFERENCES exchanges(id),
FOREIGN KEY (sector_id) REFERENCES sectors(id) 
);
CREATE TABLE daily_prices (
security_id INTEGER NOT NULL, 
FOREIGN KEY (security_id) REFERENCES securities(id),
trade_date DATE,
open_price DECIMAL(10,2),
high DECIMAL(10,2),
low DECIMAL(10,2),
close_price DECIMAL(10,2),
volume BIGINT,
PRIMARY KEY (security_id, trade_date)
);

SHOW TABLES;
SHOW CREATE TABLE daily_prices;
