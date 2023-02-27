DROP DATABASE IF EXISTS `GesCom`;

CREATE DATABASE `GesCom`;

USE `GesCom`;

CREATE TABLE Suppliers(

    sup_id INT NOT NULL AUTO_INCREMENT,
    sup_name VARCHAR(50) NOT NULL,
    sup_city VARCHAR(50) NOT NULL,
    sup_address VARCHAR(150) NOT NULL,
    sup_mail VARCHAR(75),
    sup_phone INT(10),
    PRIMARY KEY(sup_id)
);

CREATE TABLE Customers(

    cus_id INT NOT NULL AUTO_INCREMENT,
    cus_lastname VARCHAR(50) NOT NULL,
    cus_firstname VARCHAR(50) NOT NULL,
    cus_address VARCHAR(150) NOT NULL,
    cus_zipcode VARCHAR(5) NOT NULL,
    cus_city VARCHAR(50) NOT NULL,
    cus_mail VARCHAR(75),
    cus_phone INT(10),
    PRIMARY KEY(cus_id)
);

CREATE TABLE Orders(

    ord_id INT NOT NULL AUTO_INCREMENT,
    ord_order_date DATE DEFAULT CURTIME(),
    ord_ship_date DATE,
    ord_bill_date DATE,
    ord_reception_date DATE,
    ord_status VARCHAR(50) NOT NULL,
    cus_id INT NOT NULL,
    PRIMARY KEY(ord_id),
    FOREIGN KEY (cus_id) REFERENCES Customers(cus_id)
);

CREATE TABLE Categorie(

    cat_id INT NOT NULL AUTO_INCREMENT,
    cat_name VARCHAR(25),
    cat_parents_id INT,
    PRIMARY KEY(cat_id)
);


CREATE TABLE Products(

    pro_id INT NOT NULL AUTO_INCREMENT,
    pro_ref VARCHAR(10) NOT NULL,
    pro_name VARCHAR(200) NOT NULL,
    pro_desc TEXT NOT NULL,
    pro_price DECIMAL(6,2) NOT NULL,
    pro_stock SMALLINT,
    pro_color VARCHAR(30),
    pro_picture VARCHAR(40),
    pro_add_date DATE DEFAULT CURTIME(),
    pro_update_date DATETIME DEFAULT NOW(),
    pro_publish TINYINT NOT NULL,
    cat_id INT,
    sup_id INT,
    PRIMARY KEY(pro_id),
    FOREIGN KEY (cat_id) REFERENCES Categorie(cat_id),
    FOREIGN KEY (sup_id) REFERENCES Suppliers(sup_id)
);

CREATE TABLE Details(

    det_id INT NOT NULL AUTO_INCREMENT,
    det_price DECIMAL(6,2)CHECK (0>=10),
    det_quantity INT NOT NULL,
    pro_id INT NOT NULL,
    ord_id INT NOT NULL,
    PRIMARY KEY(det_id),
    FOREIGN KEY (pro_id) REFERENCES Products(pro_id),
    FOREIGN KEY (ord_id) REFERENCES Orders(ord_id)
);

CREATE UNIQUE INDEX `pro_ref` ON Products (`pro_id`);