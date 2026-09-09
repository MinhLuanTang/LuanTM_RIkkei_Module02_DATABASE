CREATE DATABASE quan_ly_thu_vien;
USE quan_ly_thu_vien;

CREATE TABLE books (
    ma_sach VARCHAR(10) PRIMARY KEY,
    ten_sach VARCHAR(150) NOT NULL,
    tac_gia VARCHAR(100)
);

CREATE TABLE readers (
    ma_doc_gia VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(15)
    
);

CREATE TABLE borrowings (
    ma_phieu_muon INT PRIMARY KEY,
    ma_doc_gia VARCHAR(10) NOT NULL,
    ma_sach VARCHAR(10) NOT NULL,
    ngay_muon DATE,
    ngay_tra DATE,   
    FOREIGN KEY (ma_doc_gia) REFERENCES readers(ma_doc_gia),
    FOREIGN KEY (ma_sach) REFERENCES books(ma_sach)
);

ALTER TABLE borrowings
MODIFY COLUMN ngay_muon DATE NOT NULL;