use quan_ly_furama;



insert into trinhDo(ten_trinhDo)
values
("Trung cấp"),
("Cao đẳng"),
("Đại học"),
("sau đại học");

insert into viTri(ten_viTri)
values
("giám đốc"),
("quản lý"),
("giám sát"),
("chuyên viên"),
("phục vụ"),
("Lễ tân");


insert into LoaiDichVu(ten_LoaiDichVu)
values
("Villa"),
("House"),
("Room");

insert into loaiKhach(ten_loaiKhach)
values
("Diamond"),
("Platinium"),
("Gold"),
("Silver"),
("Member");


insert into dichvudikem(ten_dichVuDiKem,gia,donvi,trangThaiKhaDung)
values
("massage",200000,1,"available"),
("karaoke",300000,1,"available"),
("thức ăn",400000,1,"not available"),
("nước uống",50000,1,"available"),
("thuê xe di chuyển tham quan resort",600000,1,"not available");



-- Sale – Marketing, Hành Chính, Phục vụ, Quản lý.
insert into bophan (ten_boPhan)
values
('Sale – Marketing'),
('Hành Chính'),
('Phục vụ'),
('Quản lý');





 -- theo năm, tháng, ngày, giờ
insert into kieuThue (ten_kieuThue,gia)
values
('theo năm', 180000000),
('theo ngày', 1000000),
('theo tháng', 20000000),
('theo giờ', 200000);

-- insert into loaiDichVu (ten_loaiDichVu)
-- values
-- ('Villa'),
-- ('House'),
-- ('Room');

insert into dichVu (ten_dichVu,dienTich,soTang,soNguoiToiDa,chiPhiThue,id_kieuThue,id_loaiDichVu,trangThai)
values
('Villa A', 150,2, 8,2000000,1,1,'not available'),
('Villa B', 150,2, 9,3000000,2,1,'available'),
('House A', 100,2, 4,1500000,3,2,'available'),
('House B', 80,2, 4,1200000,4,2,'not available'),
('Room A', 50,2, 2,700000,3,3,'available'),
('Room B', 40,2, 2,500000,2,3,'not available');



insert into nhanVien
values
(1,'NSUT Thanh Công',1,1,3,'1991-12-12',201637373,2000,'0905456789','cong@gmail.com', '123 Hải Phòng'),
(2,'Danh Hài Đức Sang',2,2,3,'1992-12-12',201637373,1500,'0905456789','cong@gmail.com', '123 Hải Phòng'),
(3,'Tuấn Tài tu',3,3,1,'1997-12-12',201637373,1200,'0905456789','cong@gmail.com',' Hải Châu -Đà Nẵng'),
(4,'Ngo Chan Khải',2,3,2,'1997-12-12',201637373,1200,'0905456789','cong@gmail.com', 'Vinh'),
(5,'Tùng Tieu',4,2,2,'2015-12-12',201637373,1200,'0905456789','cong@gmail.com', 'Hải Châu -Đà Nẵng'),
(6,'Tao Thao',3,1,1,'2015-12-12',201637373,1200,'0905456789','cong@gmail.com', 'Quảng Ngãi'),
(7,'Hau Hom Hinh',5,3,2,'1992-12-12',201637373,1200,'0905456789','cong@gmail.com', 'Quảng Trị'),
(8,'Luu Bi',4,2,1,'1992-12-12',201637373,1200,'0905456789','cong@gmail.com', 'Vinh');

insert into khachhang
values
(1,1,'Nguyen A','1987-6-12',201523234,'0905867123','a@gmail.com','44 Quảng Ngãi'),
(2,2,'Nguyen B','2015-6-12',201523234,'0905867123','b@gmail.com','Đà Nẵng'),
(3,1,'Nguyen A','1966-6-12',201523234,'0905867123','c@gmail.com','Quảng Trị'),
(4,1,'Nguyen D','1977-6-12',201523234,'0905867123','d@gmail.com','Đà Nẵng'),
(5,2,'Nguyen E','1980-6-12',201523234,'0905867123','e@gmail.com','44 Vinh'),
(6,1,'Nguyen C','1985-6-12',201523234,'0905867123','a@gmail.com','Vinh'),
(7,2,'Nguyen D','2015-6-12',201523234,'0905867123','b@gmail.com','Đà Nẵng'),
(8,3,'Nguyen F','1987-6-12',201523234,'0905867123','c@gmail.com','Quảng Trị'),
(9,2,'Nguyen G','2000-6-12',201523234,'0905867123','d@gmail.com','Đà Nẵng'),
(10,5,'Nguyen H','1997-6-12',201523234,'0905867123','e@gmail.com','Quảng Ngãi');

insert into HopDong(id_nhanVien,id_khachHang,id_dichVu,ngayLamHopDong,ngayKetThuc,tienDatCoc)
values
(1,1,1,"2015-12-12","2019-03-12",1000000),
(2,2,2,"2018-12-12","2019-02-12",1000000),
(3,3,3,"2019-12-12","2019-09-12",1000000),
(4,4,4,"2018-01-12","2019-02-12",1000000),
(5,5,5,"2019-12-12","2019-08-12",1000000),
(5,3,3,"2019-09-12","2015-11-12",1000000),
(1,1,2,"2015-12-12","2019-03-12",1000000),
(2,2,2,"2018-12-12","2019-02-12",1000000),
(3,3,3,"2019-12-12","2019-09-12",1000000),
(4,4,4,"2018-01-12","2019-02-12",1000000),
(5,5,5,"2019-01-12","2019-08-12",1000000),
(5,3,3,"2019-09-12","201-11-12",1000000);




insert into hopDongChiTiec(id_hopDong,id_dichVuDiKem,soLuong)
values
(1,1,1),
(1,2,5),
(3,3,7),
(4,2,10),
(5,2,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(4,3,15),
(1,1,1),
(2,2,5),
(2,3,7),
(4,2,10),
(5,1,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15),
(1,1,1),
(2,2,5),
(3,3,7),
(4,2,10),
(5,5,15);
