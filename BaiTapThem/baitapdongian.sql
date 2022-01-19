CREATE TABLE nhacungcap
(
macongty NVARCHAR(10) NOT NULL,
CONSTRAINT pk_nhacungcap
PRIMARY KEY(macongty),
tencongty NVARCHAR(40) NOT NULL,
tengiaodich NVARCHAR(30) NULL,
diachi NVARCHAR(60) NULL,
dienthoai NVARCHAR(20) NULL,
fax NVARCHAR(20) NULL,
email NVARCHAR(50) NULL
);

CREATE TABLE loaihang
(
maloaihang INT NOT NULL,
CONSTRAINT pk_loaihang
PRIMARY KEY(maloaihang),
tenloaihang NVARCHAR(15) NOT NULL
);

CREATE TABLE mathang
(
mahang NVARCHAR(10) NOT NULL,
CONSTRAINT pk_mathang
PRIMARY KEY(mahang),
tenhang NVARCHAR(50) NOT NULL,
macongty NVARCHAR(10) NULL ,
maloaihang INT NULL ,
soluong INT NULL,
donvitinh NVARCHAR(20) NULL ,
giahang numeric(10,2)
);
CREATE TABLE nhanvien
(
manhanvien NVARCHAR(10) NOT NULL,
CONSTRAINT pk_nhanvien
PRIMARY KEY(manhanvien),
ho NVARCHAR(20) NOT NULL ,
ten NVARCHAR(10) NOT NULL ,
ngaysinh DATETIME NULL ,
ngaylamviec DATETIME NULL ,
diachi NVARCHAR(50) NULL ,
dienthoai NVARCHAR(15) NULL ,
luongcoban numeric(10,2) NULL ,
phucap numeric(10,2) NULL
);

CREATE TABLE khachhang
(
makhachhang NVARCHAR(10) NOT NULL,
CONSTRAINT pk_khachhang
PRIMARY KEY(makhachhang),
tencongty NVARCHAR(50) NOT NULL ,
tengiaodich NVARCHAR(30) NOT NULL ,
diachi NVARCHAR(50) NULL ,
email NVARCHAR(30) NULL ,
dienthoai NVARCHAR(15) NULL ,
fax NVARCHAR(15) NULL
);

CREATE TABLE dondathang
(
sohoadon INT NOT NULL,
CONSTRAINT pk_dondathang
PRIMARY KEY(sohoadon),
makhachhang NVARCHAR(10) NULL ,
manhanvien NVARCHAR(10) NULL ,
ngaydathang DATETIME NULL ,
ngaygiaohang DATETIME NULL ,
ngaychuyenhang DATETIME NULL ,
noigiaohang NVARCHAR(50) NULL
);

CREATE TABLE chitietdathang
(
sohoadon INT NOT NULL ,
mahang NVARCHAR(10) NOT NULL ,
giaban numeric(10,2) NOT NULL ,
soluong TINYINT NOT NULL ,
mucgiamgia numeric(10,2) NOT NULL,
CONSTRAINT pk_chitietdathang
PRIMARY KEY(sohoadon,mahang)
);

ALTER TABLE mathang
ADD CONSTRAINT fk_mathang_loaihang
FOREIGN KEY (maloaihang)
REFERENCES loaihang(maloaihang)
ON DELETE CASCADE ON UPDATE CASCADE ,
ADD CONSTRAINT fk_mathang_nhacungcap
FOREIGN KEY (macongty)
REFERENCES nhacungcap(macongty)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE dondathang
ADD CONSTRAINT fk_dondathang_khachhang
FOREIGN KEY (makhachhang)
REFERENCES khachhang(makhachhang)
ON DELETE CASCADE ON UPDATE CASCADE ,
ADD CONSTRAINT fk_dondathang_nhanvien
FOREIGN KEY (manhanvien)
REFERENCES nhanvien(manhanvien)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE chitietdathang
ADD CONSTRAINT fk_chitiet_dondathang
FOREIGN KEY (sohoadon)
REFERENCES dondathang(sohoadon)
ON DELETE CASCADE ON UPDATE CASCADE ,
ADD CONSTRAINT fk_chitiet_mathang
FOREIGN KEY (mahang)
REFERENCES mathang(mahang)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('1', 'Thức Uống');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('2', 'Thực Phẩm');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('3', 'Dệt May');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('4', 'Nông Sản');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('5 ', 'Tiêu Dùng');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('6', 'Văn Phòng Phẩm');

INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('1', 'Công ty cổ phần Nông Sản Việt', 'NONGSANVIET', 'Tây Nguyên','nongsanviet@vietnam.com','0246532154','032457');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('2', 'Công ty cổ phần sữa TH', 'THTRUEMILK', 'Hà Nội','thtruemilk@vietnam.com','0245512244','042456');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('3', 'Công ty cổ phần May10', 'MAY10', 'Bình Dương','may10@vietnam.com','0236739159','034679');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('4', 'Công ty cổ phần Thế Giới Di Động', 'TGDD', 'Hà Nội','tgdd@vietnam.com','0286535732','024312');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('5', 'Công ty cổ phần bánh kẹo Richy', 'RICHY', 'Hà Nội','richy@vietnam.com','0252235568','054232');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('5', 'Công ty cổ phần tập đoàn Thiên Long', 'THIENLONG', 'Hồ Chí Minh','thienlong@vietnam.com','0274783261','034412');

INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('VNM', 'Công ty cổ phần sữa Việt Nam', 'VINAMILK', 'Hà Nội', '0246569871', '085642', 'vinamilk@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('M10', 'Công Ty cổ phẩn MAY10', 'MAY10', 'Bình Dương', '0236739159', '034679', 'may10@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('BC', 'Siêu thị Big C', 'BIGC', 'Hồ Chí Minh', '0563212345', '032456', 'sieuthibigc@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('TL', 'Công ty tập đoàn Thiên Long', 'THIENLONG', 'Đồng Nai', '0465231234', '078646', 'thienlong@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('HNC', 'Hà Nội Computer', 'HNCOM', 'Hà Nội', '0532456789', '032456', 'hanoicomputer@vietnam.com');

INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH01', 'Sữa Tươi', 'VNM', '1', '200', 'Hộp', '6000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH02', 'Sữa Hộp', 'VNM', '1', '164', 'Hộp', '5000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH03', 'Khoai Lang', 'BC', '2', '30', 'Quả', '3500');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH04', 'Táo', 'BC', '2', '38', 'Quả', '4500');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH05', 'Áo Sơ Mi', 'M10', '3', '64', 'Chiếc', '95000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH06', 'Laptop', 'HNC', '5', '14', 'Chiếc', '15000000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH07', 'Bút Bi', 'TL', '6', '300', 'Chiếc', '3000');

INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('3', '4', 'CG04', '2022-01-06', '2022-01-21', '2022-01-21', 'Thái Nguyên');
INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('4', '3', 'CG03', '2022-01-05', '2022-01-19', '2022-01-19', 'Thái Nguyên');
INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('5', '2', 'CG05', '2022-01-03', '2022-01-26', '2022-01-26', 'Thái Nguyên');

INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('1', 'MH03', '3500', '70', '200');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('2', 'MH01', '6000', '100', '150');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('3', 'MH06', '15000000', '5', '300000');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('4', 'MH05', '95000', '15', '300');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('5', 'MH02', '5000', '60', '100');

INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG02', 'Nguyễn Minh', 'Đức', '1998/10/12', '2021/03/01', 'Hà Tĩnh', '0829863515', '14000000', '600000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG03', 'Phạm Tuấn', 'Phong', '1993/01/21', '2019/04/12', 'Quảng Bình', '0985857623', '18000000', '200000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG04', 'Nguyễn Đức', 'Mạnh', '1995/04/07', '2020/09/16', 'Nam Định', '0975364213', '16000000', '800000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG05', 'Phạm Thành', 'Long', '1996/07/23', '2017/12/03', 'Thái Bình', '0946321456', '13000000', '300000');

-- 1.	Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty
select nhanvien.ho, nhanvien.ten, nhanvien.diachi, nhanvien.ngaylamviec from qlbh.nhanvien;

-- 2.	Mã và tên của các mặt hàng có giá trị lớn hơn 100000 và số lượng hiện có ít hơn 50
select mathang.mahang, mathang.tenhang from qlbh.mathang
where ((giahang > 100000) and (soluong < 50));

-- 3.	Cho biết mỗi mặt hàng trong công ty do ai cung cấp
select distinct mathang.mahang, mathang.tenhang, nhacungcap.tencongty
from mathang, nhacungcap
where mathang.macongty = nhacungcap.macongty;

-- 4.	Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương=lương cơ bản+phụ cấp)
select nhanvien.ho, nhanvien.ten , (nhanvien.luongcoban+nhanvien.phucap) as 'Tiền Lương' from nhanvien;

-- 5.	Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2021.
select nv.ho, nv.ten, sum(c.soLuong) as tongSoLuong, (luongcoban*1.5) as tangLuong from DONDATHANG d
join NHANVIEN nv on nv.manhanvien = d.manhanvien
join CHITIETDATHANG c on d.sohoadon = c.sohoadon
WHERE YEAR(d.ngaydathang) = 2022
GROUP BY nv.manhanvien
HAVING tongSoLuong > 30;

-- 6.	Trong năm 2022 những mặt hàng nào đặt mua đúng một lần
select mathang.mahang, mathang.tenhang, dondathang.ngaydathang
from(mathang inner join chitietdathang on mathang.mahang = chitietdathang.mahang)
		inner join dondathang on chitietdathang.sohoadon = dondathang.sohoadon
where year(ngaydathang) = 2022
group by mathang.mahang, mathang.tenhang
having count(chitietdathang.mahang) = 1;

-- 7.	Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
select * from khachhang where not exists(select sohoadon from dondathang 
where dondathang.makhachhang = khachhang.makhachhang);

-- 8.	Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và số lượng hàng bán được của những nhân viên này là bao nhiêu
-- Cách 1 :
select nhanvien.manhanvien,ho,ten,sum(soluong) as ' Số Lượng Hàng Bán Được '
from(nhanvien inner join dondathang on nhanvien.manhanvien = dondathang.manhanvien)
inner join chitietdathang on dondathang.sohoadon = chitietdathang.sohoadon
group by nhanvien.manhanvien,ho,ten
having sum(soluong) >= all(select sum(soluong)
from (nhanvien inner join dondathang on nhanvien.manhanvien = dondathang.manhanvien)
inner join chitietdathang on dondathang.sohoadon = chitietdathang.sohoadon
group by nhanvien.manhanvien,ho,ten);

-- Cách 2
select nv.manhanvien,ho,ten,sum(ctdh.soluong) as 'Số Lượng Bán Được'
from nhanvien nv, dondathang ddh, chitietdathang ctdh
where nv.manhanvien = ddh.manhanvien and ddh.sohoadon = ctdh.sohoadon
group by nv.manhanvien,ho,ten
having sum(soluong) >= all(select sum(soluong)
from nhanvien nv, dondathang ddh, chitietdathang ctdh
where nv.manhanvien = ddh.manhanvien and ddh.sohoadon = ctdh.sohoadon
group by nv.manhanvien,ho,ten);

-- 9.	Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất
update nhanvien set nhanvien.phucap = (luongcoban+phucap)/2 
where manhanvien in (select manhanvien from dondathang, chitietdathang 
where dondathang.sohoadon = chitietdathang.sohoadon
group by manhanvien
having sum(soluong) >= all
(select sum(soluong)
from dondathang , chitietdathang
where dondathang.sohoadon = chitietdathang.sohoadon
group by manhanvien));

-- Thông kê trong năm 2006 mỗi một mặt hàng trong mỗi tháng và trong cả năm bán được với số lượng bao nhiêu
-- (Yêu cầu kết quả hiểu thị dưới dạng bảng, hai cột đầu là mã hàng, tên hàng, các cột còn lại tương ứng từ tháng 1 
--  đến tháng 12 và cả năm. Như vậy mỗi dòng trong kết quả cho biết số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng
select ctdh.mahang,tenhang,
sum(case month(ngaydathang) when 1 then ctdh.soluong else 0 end) as t1,
sum(case month(ngaydathang) when 2 then ctdh.soluong else 0 end) as t2,
sum(case month(ngaydathang) when 3 then ctdh.soluong else 0 end) as t3,
sum(case month(ngaydathang) when 4 then ctdh.soluong else 0 end) as t4,
sum(case month(ngaydathang) when 5 then ctdh.soluong else 0 end) as t5,
sum(case month(ngaydathang) when 6 then ctdh.soluong else 0 end) as t6,
sum(case month(ngaydathang) when 7 then ctdh.soluong else 0 end) as t7,
sum(case month(ngaydathang) when 8 then ctdh.soluong else 0 end) as t8,
sum(case month(ngaydathang) when 9 then ctdh.soluong else 0 end) as t9,
sum(case month(ngaydathang) when 10 then ctdh.soluong else 0 end) as t10,
sum(case month(ngaydathang) when 11 then ctdh.soluong else 0 end) as t11,
sum(case month(ngaydathang) when 12 then ctdh.soluong else 0 end) as t12,
sum(ctdh.soluong) as 'Cả Năm'
from (dondathang ddh inner join chitietdathang ctdh on ddh.sohoadon = ctdh.sohoadon)
inner join mathang mh on ctdh.mahang = mh.mahang
where year(ngaydathang) = 2022
group by ctdh.mahang,tenhang;