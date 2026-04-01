-- Tạo table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Insert ~1000 records
INSERT INTO customers (name, email)
SELECT 
    'User ' || i,
    'user' || i || '@example.com'
FROM generate_series(1, 1000) AS s(i);

-- Enable replica identity (quan trọng cho CDC update/delete)
ALTER TABLE customers REPLICA IDENTITY FULL;

-- Tạo publication cho CDC
CREATE PUBLICATION my_publication FOR TABLE customers;