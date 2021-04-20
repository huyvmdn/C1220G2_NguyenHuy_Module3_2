use quan_ly_furama;

-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
drop view if exists sum_tong_tien;

create view sum_tong_tien
as
select  kh.id_khachHang, kh.id_loaiKhach,hd.ngayLamHopDong,  sum(dv.chiPhiThue + (dvdk.gia * hdct.soLuong)) as TongTien
from khachHang kh
 inner join loaikhach lk on kh.id_loaiKhach = lk.id_loaiKhach
 inner join hopdong hd on kh.id_khachHang = hd.id_khachHang
 inner join dichvu dv on hd.id_dichVu = dv.id_dichVu
 inner join hopdongchitiec hdct on hdct.id_hopDong=hd.id_hopDong
inner join dichvudikem dvdk on dvdk.id_dichVuDiKem = hdct.id_dichVuDiKem
where ngayLamHopDong>= '2019-01-01' and ngayLamHopDong< '2020-01-01' and kh.id_loaiKhach=2
group by hd.id_khachHang
having TongTien > 10000000;



update khachHang
set  id_loaiKhach=1
where id_khachHang  in (
	select id_khachHang
	from sum_tong_tien
)




