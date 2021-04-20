use quan_ly_furama;

select kh.id_khachHang,kh.ten_khachHang, lk.ten_loaiKhach,hd.id_hopDong,dv.ten_dichVu,hd.ngayLamHopDong,hd.ngayKetThuc, sum(dv.chiPhiThue + (dvdk.gia * hdct.soLuong)) as TongTien
from khachHang kh
 left join loaikhach lk on kh.id_loaiKhach = lk.id_loaiKhach
 left join hopdong hd on kh.id_khachHang = hd.id_khachHang
 left join dichvu dv on hd.id_dichVu = dv.id_dichVu
 left join hopdongchitiec hdct on hdct.id_hopDong=hd.id_hopDong
left join dichvudikem dvdk on dvdk.id_dichVuDiKem = hdct.id_dichVuDiKem
group by kh.id_khachHang
