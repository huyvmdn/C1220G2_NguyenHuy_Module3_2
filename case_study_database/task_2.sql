use quan_ly_furama;

select *
from nhanvien
 where (ten_nhanvien regexp "[KTH][a-z]*$") and length(ten_nhanvien)<15;
 -- ----------------------------------------------------------------------------------

 select *
 from nhanvien
 where ( ten_nhanvien like 'K%'or ten_nhanvien like'T%'or ten_nhanvien like 'H%') and length(ten_nhanvien)<15;
 