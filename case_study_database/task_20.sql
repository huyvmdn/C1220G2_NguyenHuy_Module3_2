
 -- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi
use quan_ly_furama;

select id_nhanVien as id, ten_nhanVien,ngaySinh,soCMND,SDT,email,diaChi,  true 'nhân viên'
from nhanvien 
union all
select id_khachHang as id,ten_khachHang,ngaySinh,soCMND,SDT,email,diaChi, false 'khách hàng'
from khachhang;