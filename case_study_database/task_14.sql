use quan_ly_furama;

select *, count(hdct.id_dichVuDiKem) as so_lan_su_dung
from dichvudikem dvkd
left join hopdongchitiec hdct on  hdct.id_dichVuDiKem =dvkd.id_dichVuDiKem
left join hopdong hd on hd.id_hopDong= hdct.id_hopDong
group by hdct.id_dichVuDiKem
having so_lan_su_dung=1;
