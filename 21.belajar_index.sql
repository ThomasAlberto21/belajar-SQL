CREATE TABLE
    sellers (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        name2 VARCHAR(100) NOT NULL,
        name3 VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,
        PRIMARY KEY(id),
        INDEX name_name2_name3(name, name2, name3)
    ) ENGINE = InnoDB;

DROP TABLE sellers;

DESC sellers;

SELECT * FROM sellers WHERE name = "x" AND name2 = "x" AND name3 = "x";