CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE orders (
    ma_don_hang VARCHAR(10) PRIMARY KEY,
    ngay_dat DATETIME NOT NULL,
    tong_tien DECIMAL(12, 2) NOT NULL
);

CREATE TABLE products (
    ma_san_pham VARCHAR(10) PRIMARY KEY,
    ten_san_pham VARCHAR(150) NOT NULL,
    gia_ban DECIMAL(12, 2) NOT NULL
    
);

CREATE TABLE order_items (
    ma_don_hang VARCHAR(10)  PRIMARY KEY,
    ma_san_pham VARCHAR(10) NOT NULL,
    so_luong INT NOT NULL,
    FOREIGN KEY (ma_don_hang) REFERENCES orders(ma_don_hang),
    FOREIGN KEY (ma_san_pham) REFERENCES products(ma_san_pham)
);