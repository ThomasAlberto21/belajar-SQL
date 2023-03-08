-- Todo Many to Many Relationship

-- Many to Many adalah table relationship yang paling kompleks, dan kadang membingungkan untuk pemula

-- Many to Many adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di table kedua, dan table kedua pun punya banyak relasi di table pertama

-- Ini memang sedikit membingungkan, bagaimana caranya bisa relasi kebanyakan secara bolak balik, sedangkan di table kita cuma punya 1 kolom?

-- Contoh relasi many to many adalah relasi antara produk dan penjualan, dimana setiap produk bisa dijual berkali kali, dan setiap penjualan bisa untuk lebih dari satu produk

-- Todo Many to Many Relationship

-- Many to Many adalah table relationship yang paling kompleks, dan kadang membingungkan untuk pemula

-- Many to Many adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di table kedua, dan table kedua pun punya banyak relasi di table pertama

-- Ini memang sedikit membingungkan, bagaimana caranya bisa relasi kebanyakan secara bolak balik, sedangkan di table kita cuma punya 1 kolom?

-- Contoh relasi many to many adalah relasi antara produk dan penjualan, dimana setiap produk bisa dijual berkali kali, dan setiap penjualan bisa untuk lebih dari satu produk


CREATE TABLE
    orders (
        id INT NOT NULL AUTO_INCREMENT,
        total INT NOT NULL,
        order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY(id)
    ) ENGINE = InnoDB;

DESC orders;

CREATE TABLE
    orders_detail(
        id_products VARCHAR(10) NOT NULL,
        id_orders INT NOT NULL,
        price INT NOT NULL,
        quantity INT NOT NULL,
        PRIMARY KEY(id_products, id_orders)
    ) ENGINE = InnoDB;

DESC orders_detail;

ALTER TABLE orders_detail
ADD
    CONSTRAINT fk_orders_detail_products FOREIGN KEY(id_products) REFERENCES products(id);

ALTER TABLE orders_detail
ADD
    CONSTRAINT fk_orders_detail_orders FOREIGN KEY(id_orders) REFERENCES orders(id);

SHOW CREATE TABLE orders_detail;

INSERT INTO orders(total) VALUES(50000);

INSERT INTO
    orders_detail(
        id_products,
        id_orders,
        price,
        quantity
    )
VALUES ("P0001", 1, 25000, 1), ("P0002", 1, 25000, 1);

INSERT INTO
    orders_detail(
        id_products,
        id_orders,
        price,
        quantity
    )
VALUES ("P0003", 2, 25000, 1), ("P0004", 3, 25000, 1);

INSERT INTO
    orders_detail(
        id_products,
        id_orders,
        price,
        quantity
    )
VALUES ("P0001", 2, 25000, 1), ("P0003", 3, 25000, 1);

SELECT * FROM orders;

SELECT * FROM orders_detail;

SELECT orders.id , products.id , products.name , orders_detail.quantity , orders_detail.price 
FROM orders
    JOIN orders_detail ON(
        orders_detail.id_orders = orders.id
    )
    JOIN products ON (products.id = orders_detail.id_products );