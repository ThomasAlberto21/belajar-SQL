-- Todo One To One Relationship
-- One to One relationship adalah relasi antar tabel yang paling sederhana
-- Artinya tiap data di sebuah tabel hanya boleh berelasi ke maksimal 1 data di tabel lainnya
-- Tidak boleh ada relasi lebih dari 1 data
-- Contoh misal, kita membuat aplikasi toko online yang terdapat fitur wallet, dan 1 customer, cuma boleh punya 1 wallet




CREATE TABLE
    wallet(
        id INT NOT NULL AUTO_INCREMENT,
        id_customers INT NOT NULL,
        ballance INT NOT NULL DEFAULT 0,
        PRIMARY KEY(id),
        UNIQUE KEY id_customers_unique(id_customers),
        FOREIGN KEY fk_wallet_customers(id_customers) REFERENCES customers (id)
    ) ENGINE = InnoDb;

DESC wallet;

SELECT * FROM customers;

INSERT INTO wallet(id_customers) VALUES (1) , (3);

SELECT * FROM wallet;

SELECT
    customers.email,
    wallet.ballance
FROM wallet
    JOIN customers ON(
        wallet.id_customers = customers.id
    );