-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

use quan_ly_furama;

drop view if exists so_lan_su_dung;

create view so_lan_su_dung
as
select dvdk.id_dichVuDiKem, count(hdct.id_dichVuDiKem) as so_lan_su_dung
from dichVuDiKem dvdk
inner join hopdongchitiec hdct on hdct.id_dichVuDiKem=dvdk.id_dichVuDiKem
inner join hopdong hd on hd.id_hopDong = hdct.id_hopDong
where year(hd.ngayLamHopDong)=2019
group by hdct.id_dichVuDiKem
having so_lan_su_dung>=10;

update dichvudikem
set gia= gia*2
where id_dichVuDiKem in( select id_dichVuDiKem
from so_lan_su_dung
) ;

