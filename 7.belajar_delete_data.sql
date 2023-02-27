-- Todo Membuat Table

CREATE TABLE
    products (
        id VARCHAR(10) NOT NULL,
        name VARCHAR(100) NOT NULL,
        description TEXT,
        price INT UNSIGNED NOT NULL,
        quantity INT UNSIGNED NOT NULL DEFAULT 0,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) ENGINE = InnoDB;

-- Todo Melihat Semua Table

SHOW TABLES;

-- Todo Melihat Deskripsi Table

DESC products;

-- Todo Memasukkan Data Ke Dalam Table Hanya 1 Data Saja

INSERT INTO
    products (
        id,
        name,
        description,
        price,
        quantity
    )
VALUES (
        "P0001",
        "Mie Ayam",
        "Mie Ayam Original",
        20000,
        5
    );

-- Todo Memasukkan Banyak Data Ke Dalam Table Sekaligus

INSERT INTO
    products (
        id,
        name,
        description,
        price,
        quantity
    )
VALUES (
        "P0002",
        "Mie Ayam Bakso",
        "Mie Ayam + Bakso",
        25000,
        5
    ), (
        "P0003",
        "Mie Ayam Tahu",
        "Mie Ayam + Tahu",
        15000,
        2
    ), (
        "P0004",
        "Nasi Goreng",
        "Nasi Goreng Original",
        10000,
        3
    ), (
        "P0005",
        "Nasi Goreng Telur",
        "Nasi Goreng + Telur",
        12000,
        3
    ), (
        "P0006",
        "Rendang ",
        "Rendang",
        50000,
        3
    ), (
        "P0007",
        "Bubur ",
        "Bubur Original",
        8000,
        3
    ), (
        "P0008",
        "Sate ",
        "Sate Ayam",
        15000,
        3
    ), (
        "P0009",
        "Kari",
        "Kari Ayam",
        15000,
        3
    ), (
        "P0010",
        "Mie Goreng",
        "Mie Goreng Sedap",
        15000,
        3
    );

-- Todo Mengambil Semua Data Yang Telah Kita Insert

SELECT * FROM products;

-- Todo Hanya Mengambil Sebagian Kolom Saja Yang Telah Kita Insert

SELECT id , name , price , quantity FROM products;

-- Todo Menambahkan Primary Key Untuk id Agar Tidak Ada id Yang Dibuat Duplikat

ALTER TABLE products ADD PRIMARY KEY(id);

-- Todo Untuk Melihat Apa Saja Kolom Yang Ada Di Dalam Table

SHOW CREATE TABLE products;


-- Todo Where Digunakan Untuk Mencari / Memfilter Data Sesuai Yang Kita Inginkan

SELECT * FROM products WHERE id = "P0001";

SELECT * FROM products WHERE name = "Nasi Goreng";

SELECT * FROM products WHERE quantity = 5;

SELECT * FROM products WHERE price = 15000;


-- Todo Menambahkan Kolom Baru Yaitu Category

ALTER TABLE products
ADD
    COLUMN category ENUM ("Makanan", "Minuman") AFTER NAME;

SELECT * FROM products;



-- Todo Mengupdate Data

UPDATE products SET category = "Makanan" WHERE id = "P0001";

UPDATE products SET category = "Makanan" WHERE id = "P0002";

UPDATE products SET category = "Makanan" WHERE id = "P0003";

UPDATE products SET category = "Makanan" WHERE id = "P0004";

UPDATE products SET category = "Makanan" WHERE id = "P0005";

UPDATE products SET category = "Makanan" WHERE id = "P0006";

UPDATE products SET category = "Makanan" WHERE id = "P0007";

UPDATE products SET category = "Makanan" WHERE id = "P0008";

UPDATE products SET category = "Makanan" WHERE id = "P0009";

UPDATE products SET category = "Makanan" WHERE id = "P0010";

UPDATE products SET price = price + 5000 WHERE id = "P0001";

UPDATE products SET price = price + 5000 WHERE id = "P0002";



-- Todo Menghapus Data Yang Ada Di Table
DELETE FROM products
WHERE id = "P0010";


SELECT * FROM products;