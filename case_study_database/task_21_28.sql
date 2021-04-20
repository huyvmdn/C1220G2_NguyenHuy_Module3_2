use quan_ly_furama;

-- task 21----------------------------------------------------

drop view if exists v_nhanvien;
create view v_nhanvien
as
select nv.id_nhanvien,nv.ten_nhanVien,hd.id_hopDong,hd.id_khachHang,hd.ngayLamHopDong,hd.ngayKetThuc,hd.tienDatCoc
from nhanvien nv
inner join hopdong hd on hd.id_nhanVien=nv.id_nhanVien
where diaChi like '%Hải Châu%' and hd.ngayLamHopDong = '2019-12-12'
group by nv.id_nhanvien;

-- task 22----------------------------------------------------

update nhanvien
set diaChi= 'Liên Chiểu'
where id_nhanvien in (
select id_nhanvien
from v_nhanvien
);

-- task 23----------------------------------------------------

delimiter //
create procedure Sp_1 (id int(20))
begin
    delete from khachhang
    where id_khachHang = id;
end;
// delimiter ;


-- task 24----------------------------------------------------


delimiter //
create procedure Sp_2 (in_id_nhanVien int(20),in_id_khachHang int(20),in_id_dichVu int(20),ngayLamHopDong date, ngayKetThuc date, tienDatCoc int(20), out result varchar(50))
begin
	
    set @check_id_nhanvien = 0;
    select id_nhanVien into @check_id_nhanvien
    from nhanvien
    where id_nhanvien = in_id_nhanVien;
    
    set @check_id_khachhang = 0;
    select id_khachHang into @check_id_khachhang
    from khachhang
    where id_khachHang = in_id_khachHang;
    
	set @check_id_dichvu = 0;
    select id_dichvu into @check_id_dichvu
    from dichvu
    where id_dichvu = check_id_dichvu;
    
    if(@check_id_dichvu <> 0 and @check_id_khachhang<>0 and @check_id_nhanvien<>0) then
     insert into HopDong 
    values
    (in_id_nhanVien ,
    in_id_khachHang ,
    in_id_dichVu ,
    ngayLamHopDong ,
    ngayKetThuc ,
    tienDatCoc) ;
    set result ="dữ liệu nhập vào thành công";
    else set result ="dữ liệu nhập vào sai hoặc không đúng thông tin";
	end if;
end;
// delimiter ;

-- task 25----------------------------------------------------

delimiter //
create trigger xoa_hopdong	
after delete
on hopdong for each row
begin
set @x=( select count(*)
from hopdong);
end;
// delimiter ;
set @x=0;
delete from  hopdong where id_hopdong=3;
select @x as 'số lượng hợp đồng còn lại'


-- task 26----------------------------------------------------

-- 26.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
--  với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật,
--  nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database

delimiter //
create trigger Tr_2	
before update
on hopdong for each row
begin
	IF DATEDIFF(new.ngayKetThuc,old.ngayLamHopDong)<2 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
end if;
end;
// delimiter ;


-- task 27----------------------------------------------------
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.

delimiter //
create function tong_dich_vu ()
returns int
deterministic
begin

   create TEMPORARY table temp
    select sum( dv.chiPhiThue) as tong_tien_dich_vu
    from dichvu dv
    inner join hopdong hd on hd.id_dichVu= dv.id_dichVu
	group by hd.id_dichVu
    having tong_tien_dich_vu>2000000;
    
    set @tong_so_dich_vu = (select count(*) from temp);
	DROP temporary TABLE if exists temp;
	
    
	return  @tong_so_dich_vu;
end;
// delimiter ;

select tong_dich_vu();

-- task 28----------------------------------------------------

-- 28.	Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019
--  để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dichvu) và xóa những HopDong sử dụng dịch vụ liên quan
--  (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.


drop procedure Sp_3;

delimiter //
create procedure Sp_3 ()
begin
	delete from dichvu
    where id_loaiDichVu in (select temp2.id_loaiDichVu
    from (
    select id_loaiDichVu
    from dichvu dv
    inner join hopdong hd on hd.id_dichVu= dv.id_dichVu
    where id_loaiDichVu = 3 and year(hd.ngayLamHopDong) between 2015 and 2019
    )  
    as temp2      ) ;
end;
// delimiter ;


call Sp_3;