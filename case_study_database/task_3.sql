use quan_ly_furama;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khachHang
having ( (year(now())-year(ngaySinh))>=18 and (year(now())-year(ngaySinh))<=50 )
and  ( diaChi like '%Đà Nẵng%' or diaChi like '%Quảng Trị%') ;
-- ----------------------------------------------------------------------------------

select *
from khachhang
where  datediff(now(),ngaySinh)>= (18*365) and datediff(now(),ngaySinh)<= (50*365) and (diaChi like'%Đà Nẵng%'or diaChi like'%Quảng Trị%');
