-- Создание базы данных
CREATE DATABASE IF NOT EXISTS electronics_store;
USE electronics_store;

-- 1. Таблица категорий (categories)
CREATE TABLE categories (
    id_category INT(6) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- 2. Таблица поставщиков (suppliers)
CREATE TABLE suppliers (
    id_supplier INT(6) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50)
);

-- 3. Таблица товаров (products)
CREATE TABLE products (
    id_product INT(6) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT(6) NOT NULL,
    description TEXT,
    category_id INT(6),
    supplier_id INT(6),
    warranty INT(3),
    FOREIGN KEY (category_id) REFERENCES categories(id_category),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id_supplier)
);

-- 4. Таблица покупателей (customers)
CREATE TABLE customers (
    id_customer INT(6) PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(30) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- 5. Таблица заказов (orders)
CREATE TABLE orders (
    id_order INT(6) PRIMARY KEY AUTO_INCREMENT,
    customer_id INT(6),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Новый',
    payment_method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(id_customer)
);

-- 6. Таблица состава заказа (order_items)
CREATE TABLE order_items (
    id_order_item INT(6) PRIMARY KEY AUTO_INCREMENT,
    order_id INT(6),
    product_id INT(6),
    quantity INT(6) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id_order) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id_product)
);
