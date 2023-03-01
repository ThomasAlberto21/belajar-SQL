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

INSERT INTO
    products (
        id,
        name,
        description,
        price,
        quantity
    )
VALUES (
        "P0010",
        "Mie Goreng",
        "Mie Goreng Sedap",
        15000,
        3
    );

INSERT INTO
    products (
        id,
        name,
        description,
        price,
        quantity
    )
VALUES (
        "P0011",
        "Teh Es",
        "Teh + Es",
        6000,
        2
    ), (
        "P0012",
        "Jus Apel ",
        "Jus + Apel",
        10000,
        5
    ), (
        "P0013",
        "Jus Mangga",
        "Jus + Mangga",
        10000,
        10
    ), (
        "P0014",
        "Kopi",
        "Kopi + Susu",
        12000,
        4
    ), (
        "P0015",
        "Extra Joss Susu",
        "Extra Joss + Susu",
        8000,
        5
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

UPDATE products SET category = "Minuman" WHERE id = "P0011";

UPDATE products SET category = "Minuman" WHERE id = "P0012";

UPDATE products SET category = "Minuman" WHERE id = "P0013";

UPDATE products SET category = "Minuman" WHERE id = "P0014";

UPDATE products SET category = "Minuman" WHERE id = "P0015";

UPDATE products SET price = price + 5000 WHERE id = "P0001";

UPDATE products SET price = price + 5000 WHERE id = "P0002";

-- Todo Menghapus Data Yang Ada Di Table

DELETE FROM products WHERE id = "P0010";

SELECT * FROM products;

-- Todo Alias berguna jika kita ingin mengubah nama kolom atau nama tabel ketika melakukan SELECT data

SELECT
    id AS "Kode Makanan",
    name AS "Nama",
    category AS "Kategori",
    price AS "Harga",
    quantity AS "Jumlah Produk"
FROM products;

-- Todo Where Operator

SELECT * FROM products WHERE quantity >= 2;

SELECT * FROM products WHERE quantity <= 2;

SELECT * FROM products WHERE category != "Makanan";

-- Todo Where Operator And Dan Or

SELECT * FROM products WHERE quantity > 2 AND price > 15000;

SELECT * FROM products WHERE category = "Makanan" AND price < 25000;

SELECT * FROM products WHERE quantity >= 2 OR price > 20000;

SELECT *
FROM products
WHERE (
        category = "Makanan"
        OR quantity >= 2
    )
    AND price >= 20000;

-- Todo Like Operator

SELECT * FROM products WHERE name LIKE "%Bubur%";

SELECT * FROM products WHERE name LIKE "%Mie%";

SELECT * FROM products WHERE name LIKE "%Nasi%";

-- Todo Null Operator

SELECT * FROM products WHERE description IS NULL;

SELECT * FROM products WHERE description IS NOT NULL;

-- Todo Between Operator

SELECT * FROM products WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM products WHERE price NOT BETWEEN 10000 AND 20000;

-- Todo In Operator

SELECT * FROM products WHERE category IN ("Makanan" , "Minuman");

SELECT * FROM products WHERE category NOT IN ("Makanan" , "Minuman");

-- Todo ORDER BY clause digunakan untuk mengurutkan data berdasarkan kolom yang dipilih, dan jenis urutan (ASC atau DESC)

SELECT * FROM products ORDER BY category ASC , price DESC;

-- Todo Limit Clause Digunakan Untuk Membatasi Jumlah Data Yang Diambil Di Dalam Table

SELECT * FROM products ORDER BY id LIMIT 5;

SELECT * FROM products ORDER BY id LIMIT 5 , 5;

-- Todo Distinct Berfungsi untuk menghapus data yang duplikat di query

SELECT DISTINCT category FROM products;

-- Todo Numeric FUNCTION

-- Todo Aritmethic Operator

SELECT 10 , 10, 10 + 10 AS hasil;

SELECT 10 , 10, 10 - 10 AS hasil;

SELECT 10 , 10, 10 * 10 AS hasil;

SELECT 10 , 10, 10 / 10 AS hasil;

SELECT 100 , 12, 100 % 12 AS hasil;

SELECT id ,price , price DIV 1000 AS "Price In K" FROM products;

SELECT id , name, price FROM products WHERE price DIV 1000 > 10;

-- Todo Mathematical Function

SELECT id , COS(price) , SIN(price) , tan(price) FROM products;

-- Todo String Function

SELECT
    id,
    LOWER(name) AS "lower Function",
    UPPER(name) AS "Upper Function",
    LENGTH(name) AS "Length Function"
FROM products;

-- Todo Fungsi extract digunakan untuk mengambil tanggal , bulan , tahun yang kita perlukan

SELECT
    id,
    created_at,
    EXTRACT(
        YEAR
        FROM
            created_at
    ) AS "Tahun",
    EXTRACT(
        MONTH
        FROM
            created_at
    ) AS "Bulan"
FROM products;

-- Todo Flow Control FUNCTION

SELECT
    id,
    category,
    CASE category
        WHEN "Makanan" THEN "Enak"
        WHEN "Minuman" THEN "Segar"
    END AS "Category"
FROM products;

SELECT
    id,
    price,
    IF(
        price <= 10000,
        "Murah",
        IF(
            price >= 10000
            AND price <= 20000,
            "Sedang",
            "Mahal Banget"
        )
    ) AS "Keterangan"
FROM products;

-- Todo IFNULL digunakan untuk mengganti data yang null dengan data yang kita isi sendiri

SELECT
    id,
    name,
    IFNULL(description, "Data Tidak Ada")
FROM products;


-- * AGGREGATE FUNCTION
SELECT COUNT(id) AS "Banyak Data Di MySQL" FROM products;

SELECT MAX(price) AS "Harga Termahal" FROM products;

SELECT MIN(price) AS "Harga Termurah" FROM products;

SELECT AVG(price) AS "Rata-rata Harga" FROM products;

SELECT SUM(quantity) AS "Banyak Stok Barang" FROM products;
