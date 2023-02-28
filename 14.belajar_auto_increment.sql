CREATE TABLE
    admin (
        id INT NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL,
        PRIMARY KEY(id)
    ) ENGINE = InnoDB;

DESCRIBE admin;

INSERT INTO
    admin(first_name, last_name)
VALUES ("Thomas", "Alberto"), ("Fransiskus", "Berto"), ("Annisa", "Cahaya"), ("Ryan", "Ardyan");


SELECT * FROM admin ORDER BY id;

INSERT INTO
    admin(first_name, last_name)
VALUES ("Alfa", "Hosea");

-- Todo Fungsi yang digunakan untuk melihat id terakhir yang kita buat
SELECT LAST_INSERT_ID();