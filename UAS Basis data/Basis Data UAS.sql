-- Membuat Tabel Barang dengan PostgreSQL
CREATE TABLE Barang (
    Id_Barang SERIAL PRIMARY KEY,
    Id_Transaksi INT,
    Jumlah_Produk VARCHAR(50)
);

-- Membuat Tabel Transaksi dengan PostgreSQL
CREATE TABLE Transaksi (
    Id_Transaksi SERIAL PRIMARY KEY,
    Tanggal_Transaksi DATE,
    Waktu_Transaksi TIME,
    Id_Pelanggan INT,
    Total INT,
    Kode_Pembayaran VARCHAR(10)
);

-- Membuat Tabel Pelanggan dengan PostgreSQL
CREATE TABLE Pelanggan (
    Id_Pelanggan SERIAL PRIMARY KEY,
    Nama_Pelanggan VARCHAR(50),
    Alamat_Pelanggan VARCHAR(100)
);

-- Membuat Tabel Barang_Detail dengan PostgreSQL
CREATE TABLE Barang_Detail (
    Id_Barang SERIAL PRIMARY KEY,
    Nama_Barang VARCHAR(50),
    Harga INT,
    Id_Toko INT
);

-- Membuat Tabel Pembayaran dengan PostgreSQL
CREATE TABLE Pembayaran (
    Kode_Pembayaran VARCHAR(10) PRIMARY KEY,
    Metode_Pembayaran VARCHAR(50)
);

-- Membuat Tabel Toko dengan PostgreSQL
CREATE TABLE Toko (
    Id_Toko SERIAL PRIMARY KEY,
    Nama_Toko VARCHAR(50),
    Alamat_Toko VARCHAR(100),
    No_Telepon_Toko VARCHAR(15)
);


-- Menambahkan Data Contoh ke Tabel
INSERT INTO Barang (Id_Transaksi, Jumlah_Produk) VALUES (1, '10');
INSERT INTO Transaksi (Tanggal_Transaksi, Waktu_Transaksi, Id_Pelanggan, Total, Kode_Pembayaran) VALUES ('2023-01-01', '10:00:00', 1, 100000, 'PAY001');
INSERT INTO Pelanggan (Nama_Pelanggan, Alamat_Pelanggan) VALUES ('John Doe', 'Jl. Mawar No. 1');
INSERT INTO Barang_Detail (Nama_Barang, Harga, Id_Toko) VALUES ('Produk A', 50000, 1);
INSERT INTO Pembayaran (Kode_Pembayaran, Metode_Pembayaran) VALUES ('PAY001', 'Transfer Bank');
INSERT INTO Toko (Nama_Toko, Alamat_Toko, No_Telepon_Toko) VALUES ('Toko ABC', 'Jl. Melati No. 2', '08123456789');


BEGIN;

-- Operasi DML dalam transaksi
INSERT INTO Barang (Id_Transaksi, Jumlah_Produk) VALUES (2, '5');
INSERT INTO Transaksi (Tanggal_Transaksi, Waktu_Transaksi, Id_Pelanggan, Total, Kode_Pembayaran) VALUES ('2023-01-02', '11:00:00', 2, 150000, 'PAY002');
INSERT INTO Pelanggan (Nama_Pelanggan, Alamat_Pelanggan) VALUES ('Jane Doe', 'Jl. Melati No. 3');
INSERT INTO Barang_Detail (Nama_Barang, Harga, Id_Toko) VALUES ('Produk B', 75000, 2);
INSERT INTO Pembayaran (Kode_Pembayaran, Metode_Pembayaran) VALUES ('PAY002', 'Kartu Kredit');
INSERT INTO Toko (Nama_Toko, Alamat_Toko, No_Telepon_Toko) VALUES ('Toko XYZ', 'Jl. Anggrek No. 4', '08987654321');

COMMIT;

-- Membuat Role superuser dengan semua hak akses
CREATE ROLE superuser WITH LOGIN PASSWORD 'password';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO superuser;

-- Membuat Role admin dengan hak akses INSERT dan UPDATE pada tabel tertentu
CREATE ROLE admin WITH LOGIN PASSWORD 'password';
GRANT INSERT, UPDATE ON TABLE Barang TO admin;
GRANT INSERT, UPDATE ON TABLE Transaksi TO admin;

-- Membuat Role user dengan hak akses SELECT pada semua tabel
CREATE ROLE user WITH LOGIN PASSWORD 'password';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO user;

