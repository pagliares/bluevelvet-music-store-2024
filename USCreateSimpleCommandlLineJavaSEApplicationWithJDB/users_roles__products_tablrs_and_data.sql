-- This script implements TUS-2141 and TUS-1212

-- Check if the database bluevelvet_music_store exists, and create it if it doesn't
CREATE DATABASE IF NOT EXISTS bluevelvet_music_store;

-- Switch to the bluevelvet_music_store database
USE bluevelvet_music_store;

-- Dropping existing tables if they exist
DROP TABLE IF EXISTS ROLE_USER;
DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS ROLE;
DROP TABLE IF EXISTS PRODUCTS;

-- Creating the ROLE table
CREATE TABLE ROLE (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- Inserting roles into ROLE table based on the provided data
INSERT INTO ROLE (name, description)
VALUES
('Admin', 'Manage everything'),
('Sales Manager', 'Manage product price, customers, shipping, orders and sales report'),
('Editor', 'Manage categories, brands, products, articles and menus'),
('Shipping Manager', 'view products, view orders and update order status'),
('Assistant', 'manage questions and reviews');

-- Creating the USER table
CREATE TABLE USER (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    enabled BOOLEAN DEFAULT TRUE,
    photo VARCHAR(255)
);

-- Inserting users into USER table based on the provided data
INSERT INTO USER (email, first_name, last_name, password, enabled, photo)
VALUES
('florentino@gmail.com', 'Florentino', 'Ariza', 'ariza000', TRUE, 'florentino.png'),
('fermina@yahoo.com', 'Fermina', 'Daza', 'daza123', FALSE, 'fermina.png'),
('hahari@hotmail.com', 'Yuval', 'Harari', 'haharisapiens', TRUE, 'yuval.png'),
('zola@gmail.com', 'Émile', 'Zola', 'zolagerminal', TRUE, 'emile.png'),
('kundera@gmail.com', 'Milan', 'Kundera', 'kunderamilan', FALSE, 'milan.png'),
('faulkner@gmail.com', 'William', 'Faulkner', 'faulknerw', TRUE, 'william.png'),
('fitzgerald', 'Francis', 'Fitzgerald', 'fitzgeraldscott', TRUE, 'francis.png'),
('saramago@yahoo.com.br', 'José', 'Saramago', 'saramago2022', TRUE, 'jose.png'),
('frankl', 'Viktor', 'Frankl', 'franklv', TRUE, 'viktor.png'),
('conrad@aol.com', 'Joseph', 'Conrad', 'conradj', TRUE, 'joseph.jpg'),
('verne@gmail.com', 'Júlio', 'Verne', 'verne80', FALSE, 'julio.png'),
('more@yahoo.com.br', 'Thomas', 'More', 'more1513', TRUE, 'thomas.png'),
('huxley@aol.com', 'Aldous', 'Huxley', 'huxleybrave', TRUE, 'aldous.png'),
('burgess@gmail.com', 'Antony', 'Burgess', 'burgessorange', TRUE, 'antony.png'),
('bradburry@hotmail.com', 'Ray', 'Bradburry', 'bradburry451', TRUE, 'ray.jpg'),
('azimov@gmail.com', 'Isaac', 'Azimov', 'azimovrobot', FALSE, 'isaac.png'),
('queiroz@yahoo.com.br', 'Rachel', 'Queiroz', 'queiroz15', TRUE, 'raquel.png'),
('dostoievski@gmail.com', 'Fiodor', 'Dostoievski', 'dostoievskipunish', TRUE, 'fiodor.jpg'),
('steinbeck@gmail.com', 'John', 'Steinbeck', 'steinbeckpearl', TRUE, 'john.png'),
('lispector@yahoo.com.br', 'Clarice', 'Lispector', 'lispectorestrela', TRUE, 'clarice.png');

-- Creating the ROLE_USER table (Many-to-Many relationship)
CREATE TABLE ROLE_USER (
    role_user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER(user_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES ROLE(role_id) ON DELETE CASCADE
);

-- Inserting user-role associations into ROLE_USER table
-- Based on the comma-separated roles provided for each user

-- Florentino Ariza (Admin)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (1, 1);
-- Fermina Daza (Admin)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (2, 1);
-- Yuval Harari (Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (3, 3);
-- Émile Zola (Editor, Assistant)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (4, 3), (4, 5);
-- Milan Kundera (Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (5, 3);
-- William Faulkner (Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (6, 3);
-- Francis Fitzgerald (Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (7, 3);
-- José Saramago (Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (8, 2);
-- Viktor Frankl (Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (9, 2);
-- Joseph Conrad (Editor, Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (10, 3), (10, 2);
-- Júlio Verne (Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (11, 2);
-- Thomas More (Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (12, 2);
-- Aldous Huxley (Shipping Manager, Assistant)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (13, 4), (13, 5);
-- Antony Burgess (Shipping Manager, Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (14, 4), (14, 3);
-- Ray Bradburry (Shipping Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (15, 4);
-- Isaac Azimov (Shipping Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (16, 4);
-- Rachel Queiroz (Shipping Manager, Editor)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (17, 4), (17, 3);
-- Fiodor Dostoievski (Assistant, Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (18, 5), (18, 2);
-- John Steinbeck (Assistant, Editor, Sales Manager)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (19, 5), (19, 3), (19, 2);
-- Clarice Lispector (Assistant)
INSERT INTO ROLE_USER (user_id, role_id) VALUES (20, 5);

-- Creating the PRODUCTS table
CREATE TABLE PRODUCTS (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    category VARCHAR(50)
);

-- Inserting sample data into the PRODUCTS table
INSERT INTO PRODUCTS (name, description, price, quantity, category)
VALUES
('Guitar', 'Acoustic guitar with steel strings', 199.99, 10, 'Instruments'),
('Piano', 'Grand piano with 88 keys', 4999.99, 5, 'Instruments'),
('Violin', '4/4 violin with bow and case', 299.99, 8, 'Instruments'),
('Drum Kit', '5-piece drum kit with cymbals', 799.99, 3, 'Instruments'),
('Flute', 'Silver-plated flute with hard case', 149.99, 12, 'Instruments'),
('Trumpet', 'Brass trumpet with 3 valves', 249.99, 7, 'Instruments'),
('Electric Guitar', 'Electric guitar with humbucker pickups', 399.99, 6, 'Instruments'),
('Microphone', 'Condenser microphone for studio recording', 99.99, 20, 'Accessories'),
('Guitar Strings', 'Set of steel strings for acoustic guitar', 19.99, 50, 'Accessories'),
('Piano Bench', 'Adjustable piano bench with cushion', 59.99, 15, 'Accessories');
