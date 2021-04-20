-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).

use quan_ly_furama;

drop view  khach_hang_truoc_2016;

create view khach_hang_truoc_2016
as
select kh.id_khachHang
from khachhang kh
inner join hopdong hd on hd.id_khachHang=kh.id_khachHang
where hd.ngayLamHopDong< '2016-01-01'
group by id_khachHang;

delete from khachhang
where id_khachHang  in (
	select id_khachHang
    from khach_hang_truoc_2016
    );
    
    


