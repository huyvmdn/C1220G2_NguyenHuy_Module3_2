drop database if exists quan_ly_furama ;

create database quan_ly_furama;

use quan_ly_furama;

create table loaiKhach (
 id_loaiKhach int primary key auto_increment,
 ten_loaiKhach varchar(45) not null
); 

create table viTri(
id_viTri int primary key auto_increment,
ten_viTri varchar(45) not null
);

create table trinhDo(
id_trinhDo int primary key auto_increment,
ten_trinhDo varchar(45) not null
);

create table boPhan(
id_boPhan int primary key auto_increment,
ten_boPhan varchar(45) not null
);

create table dichVuDiKem(
id_dichVuDiKem int primary key auto_increment,
ten_dichVuDiKem varchar(45) not null,
gia int,
donvi int,
trangThaiKhaDung varchar(45)
);

create table kieuThue(
id_kieuThue int primary key auto_increment,
ten_kieuThue varchar(45) not null,
gia int 
);

create table loaiDichVu (
id_loaiDichVu int primary key auto_increment,
ten_loaiDichVu varchar(45) not null
);

------------------------------------------ 2
create table dichVu (
id_dichVu int primary key auto_increment,
ten_dichVu varchar(45) not null,
dienTich int,
soTang int,
soNguoiToiDa varchar(45),
chiPhiThue varchar(45),
id_kieuThue int not null,
id_loaiDichVu int not null,
trangThai varchar(45) not null,



foreign key (id_loaiDichVu) references  loaiDichVu(id_loaiDichVu) on update cascade on delete cascade,
foreign key(id_kieuThue) references kieuThue(id_kieuThue) on update cascade on delete cascade
);

----------------------------------- 2
create table nhanVien(
id_nhanVien int primary key,
ten_nhanVien varchar(45),
id_viTri int  not null,
id_trinhDo int not null,
id_boPhan int not null,
ngaySinh date not null,
soCMND int(20) not null,
luong int(45) not null,
SDT varchar(45) not null,
email varchar(45) ,
diaChi varchar(45) not null,

foreign key (id_viTri) references viTri(id_viTri)on update cascade on delete cascade,
foreign key (id_trinhDo) references trinhDo(id_trinhDo)on update cascade on delete cascade,
foreign key(id_boPhan) references boPhan(id_boPhan)on update cascade on delete cascade
);

create table khachHang (
id_khachHang int primary key,
id_loaiKhach int not null,-- khoa phu
ten_khachHang varchar(45) not null,
ngaySinh date not null,
soCMND int(20) not null,
SDT varchar(45) not null,
email varchar(45) ,
diaChi varchar(45) not null,

foreign key (id_loaiKhach) references loaiKhach(id_loaiKhach) on update cascade on delete cascade
);



----------------------------------- 3
create table hopDong (
id_hopDong int primary key auto_increment,
id_nhanVien int not null,
id_khachHang int not null,
id_dichVu int not null,
ngayLamHopDong date not null,
ngayKetThuc date,
tienDatCoc int default 0,

foreign key(id_nhanVien) references nhanVien(id_nhanVien)on update cascade on delete cascade,
foreign key(id_khachHang) references khachHang(id_khachHang)on update cascade on delete cascade,
foreign key(id_dichVu) references dichVu(id_dichVu)on update cascade on delete cascade
);

create table hopDongChiTiec (
id_hopDongChiTiec int primary key auto_increment,
id_hopDong int not null,
id_dichVuDiKem int not null,
soLuong int,

foreign key (id_dichVuDiKem) references dichVuDiKem(id_dichVuDiKem)on update cascade on delete cascade,
foreign key(id_hopDong) references hopDong(id_hopDong)on update cascade on delete cascade
);



