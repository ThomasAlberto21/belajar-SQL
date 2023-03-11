-- Todo Membuat User

CREATE USER "thomas"@"localhost";

CREATE USER "alberto"@"%";

-- Todo Menghapus USER

DROP USER "thomas"@"localhost";

DROP USER "alberto"@"%";

-- Todo Menambah Hak Akses ke User

GRANT SELECT ON belajar_mysql.* TO "thomas"@"localhost";

GRANT SELECT ON belajar_mysql.* TO "alberto"@"%";

GRANT INSERT , UPDATE ,DELETE ON belajar_mysql.* TO "alberto"@"%";

-- Todo Menampilkan GRANTS

SHOW GRANTS FOR "thomas"@"localhost";

SHOW GRANTS FOR "alberto"@"%";

-- Todo Menghapus Hak Akses Ke USER

REVOKE SELECT ON belajar_mysql.* FROM "thomas"@"localhost";

REVOKE INSERT , UPDATE ,DELETE ON belajar_mysql.* FROM "alberto"@"%";