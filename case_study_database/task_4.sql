use quan_ly_furama;

select *, count(id_hopDong) as so_lan_dat
from hopDong hd
right join khachHang kh on hd.id_khachHang = kh.id_khachHang
where kh.id_loaiKhach = 1
group by hd.id_khachHang
order by count(id_hopDong);

