CREATE DATABASE koperasi;


CREATE TABLE anggota_koperasi(
	nik_ktp INT PRIMARY KEY,
    nama VARCHAR(15),
    alamat VARCHAR(45),
    no_telp INT
);


CREATE TABLE kartu_anggota(
	id INT PRIMARY KEY,
    nama VARCHAR(15),
    status_anggota VARCHAR(10),
    id_nik_ktp INT,
FOREIGN KEY(id_nik_ktp) REFERENCES anggota_koperasi(nik_ktp)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE kartu_diskon(
	id INT PRIMARY KEY,
    id_anggota INT,
    masa_berlaku DATE,
FOREIGN KEY(id_anggota) REFERENCES kartu_anggota(id)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE pembelian(
	id_pembelian INT PRIMARY KEY,
    jum_produk INT,
    jum_harga DOUBLE,
    id_kartu_anggota INT,
FOREIGN KEY(id_kartu_anggota) REFERENCES kartu_anggota(id)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE jenis_produk(
	id_jenis VARCHAR(45) PRIMARY KEY,
    nama_jenis VARCHAR(15)
);

CREATE TABLE produk(
	id     VARCHAR(45) PRIMARY KEY,
    nama_produk VARCHAR(15),
    harga_produk DOUBLE,
    stok INT,
    id_jenis_produk VARCHAR(45),
FOREIGN KEY(id_jenis_produk) REFERENCES jenis_produk(id_jenis)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE pembayaran(
	id_pembayaran INT PRIMARY KEY,
    tanggal DATE,
    id_diskon INT,
    besar_diskon VARCHAR(15),
    id_produk VARCHAR(45),
    total DOUBLE,
FOREIGN KEY(id_diskon) REFERENCES kartu_diskon(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_produk) REFERENCES produk(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_harga) REFERENCES produk(id)
ON DELETE CASCADE ON UPDATE CASCADE);


/* query untuk mengisi field value*/

INSERT INTO anggota_koperasi VALUES 
(12367803,'Lesmana Prawira','jl.manggis no.5',0878850456), 
(22245000,'Metha Madethen','jl.jagakarsa',08562235648), 
(89013589,'Ronaldo','jl.sawangan raya',081237908921), 
(49261701,'Laila Nur','jl.Nusantara Depok',087891223);
/* Value table anggota_koperasi */

INSERT INTO kartu_anggota VALUES
(21452,'Lesmana Prawira','aktif',12367803),
(35781,'Metha Madethen','aktif',22245000),
(47120,'Ronaldo','tidak aktif',89013589),
(70823,'Laila Nur','aktif',49261701);
 /* Value table kartu_anggota */

 INSERT INTO kartu_diskon VALUES (101,21452,'2020-12-1'), 
 (102,35781,'2019-5-3'), 
 (103,47120,'2018-4-9'), 
 (104,70823,'2022-5-6'); 
 /* Value table kartu_diskon */

INSERT INTO jenis_produk VALUES
('QZ90','Electronik'),
('FG67','Makanan'),
('ZE05','Minuman'),
('ED80','Pakaian'),
('TY67','Sembako');
 /* Value table jenis_produk */

INSERT INTO produk VALUES ('K01','Sarimie',5500,50,'FG67'), 
('L02','Kulkas Lima Pintu',2500000,10,'QZ90'), 
('Z02','Pocari Keringet',6500,20,'ZE05'), 
('R06','Kemeja',80000,5,'ED80'), 
('T12','Minyak Goreng',25000,80,'TY67');
 /* Value table produk */

 INSERT INTO pembelian VALUES
 (1011,5,350000,70823),
 (1012,3,50000,47120),
 (1013,10,1000000,35781);
 /* Value table pembelian */

 INSERT INTO pembayaran VALUES 
 (456,'2018-4-6',102,'10%','Z02',6500), 
 (457,'2017-5-1',104,'50%','R06',80000), 
 (458,'2018-1-1',103,'20%','l02',2500000);
 /* Value table pembayaran */
 





