-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
--  của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018
--  nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

use quan_ly_furama;

select dv.id_dichVu,dv.ten_dichVu,dv.dienTich,dv.soNguoiToiDa,dv.chiPhiThue,ldv.ten_loaiDichVu
from dichvu dv
left join hopdong hd on hd.id_dichVu=dv.id_dichVu
left join loaidichvu ldv on ldv.id_loaiDichVu=dv.id_loaiDichVu
	where year(hd.ngayLamHopDong) = 2018 
	and dv.id_dichVu not in (
	select id_dichVu
	from hopdong
	where year(ngayLamHopDong) =2019);
    
 --   ---------------------------------------------------------------
 
 select dv.id_dichVu,dv.ten_dichVu,dv.dienTich,dv.soNguoiToiDa,dv.chiPhiThue,ldv.ten_loaiDichVu
from dichvu dv
left join hopdong hd on hd.id_dichVu=dv.id_dichVu
left join loaidichvu ldv on ldv.id_loaiDichVu=dv.id_loaiDichVu
where exists ( select hd.id_hopDong from hopdong where year(hd.ngaylamhopdong)=2018 and hd.id_dichVu=dv.id_dichVu)
and not exists( select hd.id_hopDong from hopdong where year(hd.ngaylamhopdong)=2019 and hd.id_dichVu=dv.id_dichVu);