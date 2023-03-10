CREATE TABLE
    questbooks(
        id INT NOT NULL AUTO_INCREMENT,
        email VARCHAR(100),
        title VARCHAR(200),
        content TEXT,
        PRIMARY KEY(id)
    ) ENGINE = InnoDB;

SELECT * FROM customers;

INSERT INTO
    questbooks(email, title, content)
VALUES (
        'quest@gmail.com',
        'Hello',
        'Hello'
    ), (
        'quest2@gmail.com',
        'Hello',
        'Hello'
    ), (
        'quest3@gmail.com',
        'Hello',
        'Hello'
    ), (
        'thomas@gmail.com',
        'Hello',
        'Hello'
    ), (
        'thomas@gmail.com',
        'Hello',
        'Hello'
    ), (
        'thomas@gmail.com',
        'Hello',
        'Hello'
    );

SELECT * FROM questbooks;

-- Todo UNION

-- UNION adalah operasi menggabungkan dua buah SELECT query, dimana jika terdapat data yang duplikat, data duplikatnya akan dihapus dari hasil query

SELECT DISTINCT email
FROM customers
UNION
SELECT DISTINCT email
FROM questbooks;

-- Todo Union all

-- UNION ALL adalah operasi yang sama dengan UNION, namun data duplikat tetap akan ditampilkan di hasil query nya

SELECT DISTINCT email
FROM customers
UNION ALL
SELECT DISTINCT email
FROM questbooks;

SELECT
    emails.email,
    COUNT(emails.email)
FROM(
        SELECT email
        FROM customers
        UNION ALL
        SELECT email
        FROM
            questbooks
    ) AS emails
GROUP BY emails.email;

-- Todo Intersect

-- INTERSECT adalah operasi menggabungkan dua query, namun yang diambil hanya data yang terdapat pada hasil query pertama dan query kedua

-- Data yang tidak hanya ada di salah satu query, kan dihapus di hasil operasi INTERSECT

-- Data nya muncul tidak dalam keadaan duplikat

-- Sayangnya, MySQL tidak memiliki operator INTERSECT, dengan demikian untuk melakukan operasi INTERSECT, kita harus lakukan secara manual menggunakan JOIN atau SUBQUERY

SELECT DISTINCT email
FROM customers
WHERE email IN (
        SELECT DISTINCT email
        FROM questbooks
    );

-- Todo Minus

-- MINUS adalah operasi dimana query pertama akan dihilangkan oleh query kedua

-- Artinya jika ada data di query pertama yang sama dengan data yang ada di query kedua, maka data tersebut akan dihapus dari hasil query MINUS

-- Sayang nya, di MySQL juga tidak ada operator MINUS, namun hal ini bisa kita lakukan menggunakan JOIN

SELECT
    DISTINCT customers.email,
    questbooks.email
FROM customers
    LEFT JOIN questbooks ON(
        customers.email = questbooks.email
    )
WHERE questbooks.email IS NULL;

-- Todo Transaction

-- Saat membuat aplikasi berbasis database, jarang sekali kita akan melakukan satu jenis perintah SQL per aksi yang dibuat aplikasi

-- Contoh, ketika membuat toko online, ketika customer menekan tombol Pesan, banyak yang harus kita lakukan, misal

-- Membuat data pesanan di tabel order

-- Membuat data detail pesanan di tabel order detail

-- Menurunkan quantity di tabel produk

-- Dan yang lainnya

-- Artinya, bisa saja dalam satu aksi, kita akan melakukan beberapa perintah sekaligus

-- Jika terjadi kesalahan di salah satu perintah, harapannya adalah perintah-perintah sebelumnya dibatalkan, agar data tetap konsisten

START TRANSACTION;

INSERT INTO
    questbooks(email, title, content)
VALUES (
        "Contoh@gmail.com",
        "Contoh",
        "Contoh"
    ), (
        "Contoh2@gmail.com",
        "Contoh",
        "Contoh"
    ), (
        "Contoh3@gmail.com",
        "Contoh",
        "Contoh"
    );

SELECT * FROM questbooks;

-- Todo Menyimpan secara permanen seluruh proses transaksi
COMMIT;

START TRANSACTION;

DELETE FROM questbooks;

-- Todo Membatalkan secara permanen seluruh proses transaksi jika melakukan kesalahan
ROLLBACK;