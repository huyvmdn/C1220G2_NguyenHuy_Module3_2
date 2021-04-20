use quan_ly_furama;

select *
from nhanvien nv
left join hopdong  hd on hd.id_nhanVien=nv.id_nhanVien;

delete from nhanvien 
where id_nhanVien not in (select id_nhanVien
from hopdong 
where  ngayLamHopDong>= '2017-01-01' and ngayLamHopDong< '2020-01-01'
 );


