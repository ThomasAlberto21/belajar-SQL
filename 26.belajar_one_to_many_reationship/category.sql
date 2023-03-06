-- Todo One To Many Relationship

-- One to many relationship adalah relasi antar tabel dimana satu data bisa digunakan lebih dari satu kali di tabel relasinya

-- Berbeda dengan one to one yang cuma bisa digunakan maksimal 1 kali di tabel relasinya, one to many tidak ada batasan berapa banyak data digunakan

-- Contoh relasi antar tabel categories dan products, dimana satu category bisa digunakan oleh lebih dari satu product, yang artinya relasinya nya one category to many products

-- Pembuatan relasi one to many sebenarnya sama dengan one to one, yang membedakan adalah, kita tidak perlu menggunakan UNIQUE KEY, karena datanya memang bisa berkali-kali ditambahkan di tabel relasi nya

CREATE TABLE
    categories (
        id VARCHAR(10) NOT NULL,
        name VARCHAR(100) NOT NULL,
        PRIMARY KEY(id)
    ) ENGINE = InnoDB;

DESCRIBE categories;

ALTER TABLE products DROP COLUMN categories;

DESCRIBE products;

SELECT * FROM products;

ALTER TABLE products ADD COLUMN id_category VARCHAR(10);

ALTER TABLE products
ADD
    CONSTRAINT fk_products_categories FOREIGN KEY (id_category) REFERENCES categories(id);

SHOW CREATE TABLE products;

INSERT INTO
    categories (id, name)
VALUES ("C0001", "Makanan"), ("C0002", "Minuman"), ("C0003", "Lain-lain");

SELECT * FROM categories;

UPDATE products
SET id_category = "C0001"
WHERE
    id IN(
        "P0001",
        "P0002",
        "P0003",
        "P0004",
        "P0005",
        "P0006",
        "P0007",
        "P0008",
        "P0009",
        "P0010",
        "P0016"
    );

UPDATE products
SET id_category = "C0002"
WHERE
    id IN(
        "P0011",
        "P0012",
        "P0013",
        "P0014",
        "P0015"
    );

SELECT
    products.id,
    products.name,
    categories.name
FROM products
    JOIN categories ON (categories.id = products.id_category);