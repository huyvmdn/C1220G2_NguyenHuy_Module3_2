use quan_ly_furama;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngayLamHopDong) as thang,count(month(ngayLamHopDong)) as so_lan_dat_phong
from hopdong hd
where year(ngayLamHopDong) = 2019
group by month(ngayLamHopDong)
