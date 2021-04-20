use quan_ly_furama;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

select distinct ten_khachHang
from khachhang;

select *
from khachhang
group by ten_khachHang;

select ten_khachHang
from khachhang
union 
select ten_khachHang
from khachhang;