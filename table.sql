-- membuat table -- 
CREATE TABLE barang 
(
	id INT,
    nama VARCHAR(100),
    harga INT,
    jumlah INT
) ENGINE = InnoDB;


-- menampilkan deskrikpsi table -- 
DESCRIBE barang;

-- menambahkan table dengan type text --
ALTER TABLE barang
ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
ADD COLUMN salah TEXT;


-- menghapus table yang sudah dibuat --
ALTER TABLE barang
DROP COLUMN salah;

-- merubah tipe nya dari VARCHAR (100) manjadi VARCHAR (200) --
ALTER TABLE barang
MODIFY nama VARCHAR(200);

-- merubah tipe nya dari VARCHAR (100) manjadi VARCHAR (200) dan meletakkan posisi column nama setelah column jumlah--
ALTER TABLE barang
MODIFY nama VARCHAR(200) AFTER jumlah;


-- merubah tipe nya dari VARCHAR (100) manjadi VARCHAR (200) dan meletakkan posisi column nama menjadi column yang pertama;
ALTER TABLE barang
MODIFY nama VARCHAR(200) FIRST;

-- merubah null yang tadinya dari YES menjadi no --
ALTER TABLE barang
MODIFY id INT NOT NULL;

-- merubah null yang tadinya dari YES menjadi no --
ALTER TABLE barang
MODIFY nama TEXT NOT NULL;

-- merubah default yang berisi null menjadi default 10 --
ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 10; 

-- merubah default yang berisi null menjadi default 1200000--
ALTER TABLE barang
MODIFY harga INT NOT NULL DEFAULT 1200000; 

-- membuat column baru dengan type timestamp dan menambahkan default current_timestamp --
ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


-- memasukkan value nya ke dalam table -- 
INSERT INTO barang (id , nama) VALUES (1 , "apel");
SELECT * FROM barang;

-- menghapus semua data yang sudah dibuat di dalam table tanpa menghapus table nya-- 
TRUNCATE BARANG;

-- menghapus permanen table -- 
DROP TABLE barang;


-- menampilkan database --
SHOW TABLES;
