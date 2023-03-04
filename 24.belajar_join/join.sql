CREATE TABLE
    wishlist (
        id INT NOT NULL AUTO_INCREMENT,
        id_products VARCHAR(10) NOT NULL,
        description TEXT,
        PRIMARY KEY (id),
        CONSTRAINT fk_wishlist_products FOREIGN KEY(id_products) REFERENCES products(id)
    ) ENGINE = InnoDB;

DROP TABLE wishlist;

DESCRIBE wishlist;

SHOW CREATE TABLE wishlist;

-- Menghapus Constraint

ALTER TABLE wishlist DROP CONSTRAINT fk_wishlist_products;

-- Menambahkan Constraint

ALTER TABLE wishlist
ADD
    CONSTRAINT fk_wishlist_products FOREIGN KEY(id_products) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Berhasil karena data ada di dalam tabel referensi

INSERT INTO
    wishlist(id_products, description)
VALUES ("P0001", "Makanan Kesukaan");

-- Error karena data nya tidak ada di tabel referensi

INSERT INTO
    wishlist(id_products, description)
VALUES ("salah", "Kesukaan");

-- * Join

-- Todo Melakukan JOIN Table dan mengambil semua kolom

SELECT *
FROM wishlist
    JOIN products ON (
        wishlist.id_products = products.id
    );

-- Todo Melakukan JOIN Table dan mengambil beberapa kolom

SELECT
    wishlist.id AS wishlist_id,
    products.id AS products_id,
    products.name AS products_name,
    products.description AS products_description
FROM wishlist
    JOIN products ON(
        wishlist.id_products = products.id
    );

DESC wishlist;

-- Todo Membuat Relasi ke Table Customers

ALTER TABLE wishlist ADD COLUMN id_customers INT;

ALTER TABLE wishlist
ADD
    CONSTRAINT fk_wishlist_customers FOREIGN KEY(id_customers) REFERENCES customers(id);

SELECT * FROM customers;

UPDATE wishlist SET id_customers = 1 WHERE id = 1;

SELECT * FROM wishlist;

-- Todo Melakukan JOIN Multiple Table

SELECT
    customers.first_name AS Nama_Customers,
    products.id AS Id_Customers,
    products.name AS Nama_Products,
    wishlist.description AS Deskripsi_Products
FROM wishlist
    JOIN products ON (
        products.id = wishlist.id_products
    )
    JOIN customers ON (
        customers.id = wishlist.id_customers
    );