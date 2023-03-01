-- Active: 1677464906350@@127.0.0.1@3306@belajar_mysql

CREATE TABLE
    customers (
        id INT NOT NULL AUTO_INCREMENT,
        email VARCHAR(100) NOT NULL,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        password VARCHAR(100) NOT NULL,
        PRIMARY KEY(id),
        UNIQUE KEY email_unique(email),
        UNIQUE KEY first_name_unique(first_name),
        UNIQUE KEY last_name_unique(last_name)
    ) ENGINE = InnoDB;

DESCRIBE customers;

-- Todo Menghapus UNIQUE di email_unique

ALTER TABLE customers DROP CONSTRAINT email_unique;

-- Todo Menambahkan constraint UNIQUE di email_unique

ALTER TABLE customers ADD CONSTRAINT email_unique UNIQUE (email);

INSERT INTO
    customers(
        email,
        first_name,
        last_name,
        password
    )
VALUES (
        "frans@gmail.com",
        "Fransiskus",
        "Berto",
        "FransiskusBerto123"
    );

SELECT * FROM customers;