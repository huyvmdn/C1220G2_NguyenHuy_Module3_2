use quan_ly_furama;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select hd.id_hopDong, hd.ngayLamHopDong, hd.ngayKetThuc, hd.tienDatCoc, count(hdct.id_dichVuDiKem) as SoLuongDichVuDiKem
from hopdong hd
left join dichvu dv on  dv.id_dichVu = hd.id_dichVu
inner join hopdongchitiec hdct on hdct.id_hopDong= hd.id_hopDong
inner join dichvudikem dvdk on hdct.id_dichVuDiKem= dvdk.id_dichVuDiKem
group by (hd.id_hopDong)





