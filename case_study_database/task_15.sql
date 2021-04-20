
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm
-- IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
use quan_ly_furama;

select nv.id_nhanVien, nv.ten_nhanVien, td.ten_trinhDo, bp.ten_boPhan, nv.SDT, nv.diaChi, count(hd.id_nhanVien) as so_lan_hop_dong
from nhanvien nv
left join trinhdo td on nv.id_trinhDo=td.id_trinhDo
inner join bophan bp on nv.id_boPhan= bp.id_boPhan
inner join hopdong hd on hd.id_nhanVien = nv.id_nhanVien
where hd.ngayLamHopDong >= '2018-01-01' and hd.ngayLamHopDong < '2020-01-01'
group by hd.id_nhanVien
having so_lan_hop_dong <=3