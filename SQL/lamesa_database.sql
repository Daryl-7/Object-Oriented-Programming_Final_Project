-- ================================================
--  LA MESA — Restaurant Reservation System
--  Run this in MySQL Workbench to set up the DB
-- ================================================

CREATE DATABASE IF NOT EXISTS lamesa_db;
USE lamesa_db;

-- ------------------------------------------------
-- TABLE: customers
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS customers (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    contact     VARCHAR(20)  NOT NULL,
    email       VARCHAR(100),
    total_visits INT DEFAULT 0
);

-- ------------------------------------------------
-- TABLE: dining_tables
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS dining_tables (
    table_number VARCHAR(10)  PRIMARY KEY,
    capacity     INT          NOT NULL,
    status       ENUM('Available','Reserved') DEFAULT 'Available',
    location     VARCHAR(50)
);

-- ------------------------------------------------
-- TABLE: reservations
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS reservations (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    guest_name   VARCHAR(100) NOT NULL,
    contact      VARCHAR(20)  NOT NULL,
    date         DATE         NOT NULL,
    time         VARCHAR(10)  NOT NULL,
    guests       INT          NOT NULL,
    table_number VARCHAR(10),
    status       ENUM('Confirmed','Pending','Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (table_number) REFERENCES dining_tables(table_number)
);

-- ------------------------------------------------
-- SEED: customers
-- ------------------------------------------------
INSERT INTO customers (name, contact, email, total_visits) VALUES
('Santos, Maria',   '09171234561', 'maria.santos@email.com',   8),
('Reyes, Carlo',    '09281234562', 'carlo.reyes@email.com',     3),
('Lim, Patricia',   '09391234563', 'patricia.lim@email.com',   12),
('Cruz, Jerome',    '09451234564', 'jerome.cruz@email.com',     1),
('Dela Cruz, Ana',  '09561234565', 'ana.delacruz@email.com',    5),
('Garcia, Miguel',  '09671234566', 'miguel.garcia@email.com',   7),
('Torres, Camille', '09781234567', 'camille.torres@email.com',  2),
('Ramos, Joshua',   '09891234568', 'joshua.ramos@email.com',    9);

-- ------------------------------------------------
-- SEED: dining_tables
-- ------------------------------------------------
INSERT INTO dining_tables (table_number, capacity, status, location) VALUES
('T-01',  2,  'Available', 'Indoor'),
('T-02',  6,  'Reserved',  'Indoor'),
('T-03',  4,  'Available', 'Indoor'),
('T-04',  4,  'Reserved',  'Outdoor'),
('T-05',  8,  'Reserved',  'Outdoor'),
('T-06',  2,  'Available', 'Indoor'),
('T-07',  2,  'Reserved',  'Indoor'),
('T-08',  4,  'Available', 'Outdoor'),
('T-09',  6,  'Available', 'Indoor'),
('T-10',  4,  'Reserved',  'Outdoor'),
('T-11',  8,  'Available', 'Private'),
('T-12', 10,  'Available', 'Private');

-- ------------------------------------------------
-- SEED: reservations
-- ------------------------------------------------
INSERT INTO reservations (guest_name, contact, date, time, guests, table_number, status) VALUES
('Santos, Maria',   '09171234561', CURDATE(), '7:00 PM', 4, 'T-04', 'Confirmed'),
('Reyes, Carlo',    '09281234562', CURDATE(), '7:30 PM', 2, 'T-07', 'Pending'),
('Lim, Patricia',   '09391234563', CURDATE(), '6:00 PM', 6, 'T-02', 'Confirmed'),
('Cruz, Jerome',    '09451234564', CURDATE(), '8:00 PM', 3, 'T-10', 'Cancelled'),
('Dela Cruz, Ana',  '09561234565', CURDATE(), '8:30 PM', 5, 'T-05', 'Pending'),
('Garcia, Miguel',  '09671234566', CURDATE(), '5:30 PM', 2, 'T-06', 'Confirmed'),
('Torres, Camille', '09781234567', CURDATE(), '9:00 PM', 4, 'T-03', 'Pending'),
('Ramos, Joshua',   '09891234568', CURDATE(), '6:30 PM', 8, 'T-11', 'Confirmed');
