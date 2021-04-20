-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
use quan_ly_furama;

create view hdct_so_lan_su_dung
as
select  count(id_dichVuDiKem) as so_lan_su_dung
from hopdongchitiec
group by id_dichVuDiKem;

select *,count(hdct.id_dichVuDiKem) as so_lan_su_dung
from dichvudikem dvkd
left join hopdongchitiec hdct on  hdct.id_dichVuDiKem =dvkd.id_dichVuDiKem
left join hopdong hd on hd.id_hopDong= hdct.id_hopDong
group by hdct.id_dichVuDiKem
having count(hdct.id_dichVuDiKem) =
	(select max(so_lan_su_dung) as max
	from hdct_so_lan_su_dung);



