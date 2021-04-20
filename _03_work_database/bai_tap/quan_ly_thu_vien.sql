drop database if exists quan_ly_thu_vien;

create database quan_ly_thu_vien;

use quan_ly_thu_vien;


create table loai_sach(
	id_loai_sach int(15) primary key,
	ten_loai_sach varchar(50) not null
);



create table sach(
 id_sach int(15) primary key,
 name_sach varchar(150) not null,
 nha_xuat_ban varchar(50) not null,
 tac_gia varchar(50) not null,
 nam_xuat_ban int(4) ,
 so_lan_xuat_ban int(4) not null,
 gia double not null,
 anh varchar(1000),
 id_loai_sach int(15) ,

 foreign key (id_loai_sach) references loai_sach(id_loai_sach) 
 
 );

create table phieu_muon(
	id_phieu_muon int(15) primary key,
    id_sach int(15) not null,
    ngay_thue date not null,
    ngay_phaitra date ,
    
    foreign key (id_sach) references sach(id_sach)
    
);

-- mã thẻ, tên sinh viên, ngày sinh, địa chỉ, email, số điện thoại, ảnh
create table sinh_vien(
	id_sinh_vien int(15) primary key,
    ten_sinh_vien varchar(50) not null,
    ngay_sinh date not null,
    dia_chi varchar(255) not null,
    email varchar(255),
    so_dien_thoai int(15),
    anh varchar(1000),
	id_phieu_muon int(15),
    
    foreign key (id_phieu_muon) references phieu_muon(id_phieu_muon) on update cascade on delete cascade
);

insert into loai_sach
values
(1,'khoa học'),
(2,'văn học'),
(3,'toán'),
(4,'kinh tế'),
(5,'nhiều loại khác');



insert into sach
values
(1,'cha giàu cha nghèo','kim đồng', 'không biết', 1980, 10,80000,'chagiauchangheo.png',4),
(2,'đắc nhân tâm','kim đồng', 'không biết', 1980, 60,80000,'chagiauchangheo.png',2),
(3,'ngữ văn lớp 12','kim đồng', 'không biết', 1980, 50,80000,'chagiauchangheo.png',2),
(4,'học làm giàu','kim đồng', 'không biết', 1980, 30,80000,'chagiauchangheo.png',4),
(5,'toán lớp 8','kim đồng', 'không biết', 1980, 40,80000,'chagiauchangheo.png',3);

insert into phieu_muon
values
(1,2,'2020-10-15','2020-10-25'),
(2,1,'2020-12-10','2020-12-15'),
(3,3,'2020-02-25',2020-03-05),
(4,5,'2020-01-30','2020-02-12'),
(5,4,'2020-09-17','2020-10-17');


insert into sinh_vien
values
(1,'Công sói già', '1991-12-12', '123 Hải Phòng','cong@gmai.com', 0905123456,' không có ảnh',2),
(2,'Đông Đỏng Đảnh', '1995-01-01', '12 Hoàng Sa','dong@gmai.com', 0905123456,' không có ảnh',1),
(3,'Sang Danh Hài', '1992-03-20', '23 Lê Duẩn','sang@gmai.com', 0905123456,' không có ảnh',4),
(4,'Kha Giá Sư','1995-07-15', '13 Trần Cao Vân','kha@gmai.com', 0905123456,' không có ảnh',3);
