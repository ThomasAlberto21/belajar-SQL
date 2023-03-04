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

SELECT * FROM wishlist;