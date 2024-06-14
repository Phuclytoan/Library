create database QLTHUVIEN
go
use QLTHUVIEN
go 
create table phieumuon
(maphieu nvarchar(50),
 madg nvarchar(50),
 manv nvarchar(50)
 constraint PK_PC primary key (maphieu, madg, manv)
 );
 go
 CREATE TABLE nhanvien 
 (manv nvarchar(50) primary key, hoten nvarchar(50),  NgaySinh date,GioiTinh nvarchar(50), DiaChi nvarchar(50), dienthoai nvarchar(10)

);
go
CREATE TABLE docgia 
 (madg nvarchar(50) primary key, hoten nvarchar(50),  ngaysinh date,gioitinh nvarchar(50), thongtin nvarchar(50)

);
CREATE TABLE THELOAI (matheloai nvarchar(50) primary key, tentheloai nvarchar(50)

);
go
CREATE TABLE tacgia (matacgia nvarchar(50) primary key, tentacgia nvarchar(50)

);
go
CREATE TABLE nhaxb (manxb nvarchar(50) primary key, tennxb nvarchar(50),diachi nvarchar(50),dienthoai nvarchar(50)

);
go
CREATE TABLE sach (masach nvarchar(50) primary key, 
tensach nvarchar(50),
namxb nvarchar(50),
manxb nvarchar(50),
matheloai nvarchar(50),
matacgia nvarchar(50),
Constraint fk_manxb Foreign key (manxb) REFERENCES nhaxb(manxb),
	Constraint fk_matheloai Foreign key (matheloai) REFERENCES THELOAI(matheloai),
	Constraint fk_matacgia Foreign key (matacgia) REFERENCES tacgia(matacgia)


);
go
CREATE TABLE chitietmuon (maphieu nvarchar(50) primary key, masach nvarchar(50),ngaymuon date,ngaytra date, ghichu nvarchar(50)
Constraint PK_CTM_SA Foreign key (masach) REFERENCES SACH(masach)

);
go
select * from phieumuon
drop table phieumuon
ALTER TABLE phieumuon ADD CONSTRAINT FK_PCCTM FOREIGN KEY (maphieu) REFERENCES chitietmuon(maphieu)
ALTER TABLE phieumuon ADD CONSTRAINT FK_PCDG FOREIGN KEY (madg) REFERENCES docgia(madg)
ALTER TABLE phieumuon ADD CONSTRAINT FK_PCNV FOREIGN KEY (manv) REFERENCES nhanvien(manv)