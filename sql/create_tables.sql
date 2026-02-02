CREATE TABLE cars ( 

    id SERIAL PRIMARY KEY, 

    brand TEXT NOT NULL, 

    model TEXT NOT NULL, 

    year INTEGER, 

    color TEXT, 

    price NUMERIC(10, 2) 

); 