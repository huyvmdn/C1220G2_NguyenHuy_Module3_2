use quan_ly_furama;

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết),
--  TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

insert into hopdongchitiec
values
(64,5,2,2)

select hd.id_hopDong, nv.ten_nhanVien, kh.ten_khachHang, kh.SDT, dv.ten_dichVu, count(hdct.id_dichVuDiKem) as SoLuongDichVuDikem, hd.tienDatCoc
from hopdong hd
left join nhanvien nv on nv.id_nhanVien=hd.id_nhanVien
inner join khachhang kh on kh.id_khachHang= hd.id_khachHang
inner join dichvu dv on dv.id_dichVu= hd.id_dichVu
inner join hopdongchitiec hdct on hdct.id_hopDong= hd.id_hopDong
inner join dichvudikem dvdk on dvdk.id_dichVuDiKem= hdct.id_dichVuDiKem
where  (hd.ngayLamHopDong < '2020-01-01' and hd.ngayLamHopDong> '2019-09-30') and hd.ngayLamHopDong not in (
select ngayLamHopDong
from hopdong
where ngayLamHopDong < '2020-07-01' and ngayLamHopDong> '2019-12-31')
group by hd.id_hopDong;







