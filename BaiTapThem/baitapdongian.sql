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

INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('1', 'Th???c U???ng');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('2', 'Th???c Ph???m');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('3', 'D???t May');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('4', 'N??ng S???n');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('5 ', 'Ti??u D??ng');
INSERT INTO LOAIHANG(maloaihang,tenloaihang) VALUES ('6', 'V??n Ph??ng Ph???m');

INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('1', 'C??ng ty c??? ph???n N??ng S???n Vi???t', 'NONGSANVIET', 'T??y Nguy??n','nongsanviet@vietnam.com','0246532154','032457');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('2', 'C??ng ty c??? ph???n s???a TH', 'THTRUEMILK', 'H?? N???i','thtruemilk@vietnam.com','0245512244','042456');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('3', 'C??ng ty c??? ph???n May10', 'MAY10', 'B??nh D????ng','may10@vietnam.com','0236739159','034679');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('4', 'C??ng ty c??? ph???n Th??? Gi???i Di ?????ng', 'TGDD', 'H?? N???i','tgdd@vietnam.com','0286535732','024312');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('5', 'C??ng ty c??? ph???n b??nh k???o Richy', 'RICHY', 'H?? N???i','richy@vietnam.com','0252235568','054232');
INSERT INTO KHACHHANG(makhachhang, tencongty, tengiaodich, diachi, email, dienthoai, fax) values ('5', 'C??ng ty c??? ph???n t???p ??o??n Thi??n Long', 'THIENLONG', 'H??? Ch?? Minh','thienlong@vietnam.com','0274783261','034412');

INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('VNM', 'C??ng ty c??? ph???n s???a Vi???t Nam', 'VINAMILK', 'H?? N???i', '0246569871', '085642', 'vinamilk@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('M10', 'C??ng Ty c??? ph???n MAY10', 'MAY10', 'B??nh D????ng', '0236739159', '034679', 'may10@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('BC', 'Si??u th??? Big C', 'BIGC', 'H??? Ch?? Minh', '0563212345', '032456', 'sieuthibigc@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('TL', 'C??ng ty t???p ??o??n Thi??n Long', 'THIENLONG', '?????ng Nai', '0465231234', '078646', 'thienlong@vietnam.com');
INSERT INTO `qlbh`.`nhacungcap` (`macongty`, `tencongty`, `tengiaodich`, `diachi`, `dienthoai`, `fax`, `email`) VALUES ('HNC', 'H?? N???i Computer', 'HNCOM', 'H?? N???i', '0532456789', '032456', 'hanoicomputer@vietnam.com');

INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH01', 'S???a T????i', 'VNM', '1', '200', 'H???p', '6000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH02', 'S???a H???p', 'VNM', '1', '164', 'H???p', '5000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH03', 'Khoai Lang', 'BC', '2', '30', 'Qu???', '3500');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH04', 'T??o', 'BC', '2', '38', 'Qu???', '4500');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH05', '??o S?? Mi', 'M10', '3', '64', 'Chi???c', '95000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH06', 'Laptop', 'HNC', '5', '14', 'Chi???c', '15000000');
INSERT INTO `qlbh`.`mathang` (`mahang`, `tenhang`, `macongty`, `maloaihang`, `soluong`, `donvitinh`, `giahang`) VALUES ('MH07', 'B??t Bi', 'TL', '6', '300', 'Chi???c', '3000');

INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('3', '4', 'CG04', '2022-01-06', '2022-01-21', '2022-01-21', 'Th??i Nguy??n');
INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('4', '3', 'CG03', '2022-01-05', '2022-01-19', '2022-01-19', 'Th??i Nguy??n');
INSERT INTO `qlbh`.`dondathang` (`sohoadon`, `makhachhang`, `manhanvien`, `ngaydathang`, `ngaygiaohang`, `ngaychuyenhang`, `noigiaohang`) VALUES ('5', '2', 'CG05', '2022-01-03', '2022-01-26', '2022-01-26', 'Th??i Nguy??n');

INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('1', 'MH03', '3500', '70', '200');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('2', 'MH01', '6000', '100', '150');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('3', 'MH06', '15000000', '5', '300000');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('4', 'MH05', '95000', '15', '300');
INSERT INTO `qlbh`.`chitietdathang` (`sohoadon`, `mahang`, `giaban`, `soluong`, `mucgiamgia`) VALUES ('5', 'MH02', '5000', '60', '100');

INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG02', 'Nguy???n Minh', '?????c', '1998/10/12', '2021/03/01', 'H?? T??nh', '0829863515', '14000000', '600000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG03', 'Ph???m Tu???n', 'Phong', '1993/01/21', '2019/04/12', 'Qu???ng B??nh', '0985857623', '18000000', '200000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG04', 'Nguy???n ?????c', 'M???nh', '1995/04/07', '2020/09/16', 'Nam ?????nh', '0975364213', '16000000', '800000');
INSERT INTO `qlbh`.`nhanvien` (`manhanvien`, `ho`, `ten`, `ngaysinh`, `ngaylamviec`, `diachi`, `dienthoai`, `luongcoban`, `phucap`) VALUES ('CG05', 'Ph???m Th??nh', 'Long', '1996/07/23', '2017/12/03', 'Th??i B??nh', '0946321456', '13000000', '300000');

-- 1.	H??? t??n, ?????a ch??? v?? n??m b???t ?????u l??m vi???c c???a c??c nh??n vi??n trong cty
select nhanvien.ho, nhanvien.ten, nhanvien.diachi, nhanvien.ngaylamviec from qlbh.nhanvien;

-- 2.	M?? v?? t??n c???a c??c m???t h??ng c?? gi?? tr??? l???n h??n 100000 v?? s??? l?????ng hi???n c?? ??t h??n 50
select mathang.mahang, mathang.tenhang from qlbh.mathang
where ((giahang > 100000) and (soluong < 50));

-- 3.	Cho bi???t m???i m???t h??ng trong c??ng ty do ai cung c???p
select distinct mathang.mahang, mathang.tenhang, nhacungcap.tencongty
from mathang, nhacungcap
where mathang.macongty = nhacungcap.macongty;

-- 4.	H??y cho bi???t s??? ti???n l????ng m?? c??ng ty ph???i tr??? cho m???i nh??n vi??n l?? bao nhi??u (l????ng=l????ng c?? b???n+ph??? c???p)
select nhanvien.ho, nhanvien.ten , (nhanvien.luongcoban+nhanvien.phucap) as 'Ti???n L????ng' from nhanvien;

-- 5.	T??ng l????ng l??n g???p r?????i cho nh???ng nh??n vi??n b??n ???????c s??? l?????ng h??ng nhi???u h??n 100 trong n??m 2021.
select nv.ho, nv.ten, sum(c.soLuong) as tongSoLuong, (luongcoban*1.5) as tangLuong from DONDATHANG d
join NHANVIEN nv on nv.manhanvien = d.manhanvien
join CHITIETDATHANG c on d.sohoadon = c.sohoadon
WHERE YEAR(d.ngaydathang) = 2022
GROUP BY nv.manhanvien
HAVING tongSoLuong > 30;

-- 6.	Trong n??m 2022 nh???ng m???t h??ng n??o ?????t mua ????ng m???t l???n
select mathang.mahang, mathang.tenhang, dondathang.ngaydathang
from(mathang inner join chitietdathang on mathang.mahang = chitietdathang.mahang)
		inner join dondathang on chitietdathang.sohoadon = dondathang.sohoadon
where year(ngaydathang) = 2022
group by mathang.mahang, mathang.tenhang
having count(chitietdathang.mahang) = 1;

-- 7.	Xo?? kh???i b???ng KHACHHANG nh???ng kh??ch h??ng hi???n kh??ng c?? b???t k??? ????n ?????t h??ng n??o cho c??ng ty
select * from khachhang where not exists(select sohoadon from dondathang 
where dondathang.makhachhang = khachhang.makhachhang);

-- 8.	Nh??n vi??n n??o c???a c??ng ty b??n ???????c s??? l?????ng h??ng nhi???u nh???t v?? s??? l?????ng h??ng b??n ???????c c???a nh???ng nh??n vi??n n??y l?? bao nhi??u
-- C??ch 1 :
select nhanvien.manhanvien,ho,ten,sum(soluong) as ' S??? L?????ng H??ng B??n ???????c '
from(nhanvien inner join dondathang on nhanvien.manhanvien = dondathang.manhanvien)
inner join chitietdathang on dondathang.sohoadon = chitietdathang.sohoadon
group by nhanvien.manhanvien,ho,ten
having sum(soluong) >= all(select sum(soluong)
from (nhanvien inner join dondathang on nhanvien.manhanvien = dondathang.manhanvien)
inner join chitietdathang on dondathang.sohoadon = chitietdathang.sohoadon
group by nhanvien.manhanvien,ho,ten);

-- C??ch 2
select nv.manhanvien,ho,ten,sum(ctdh.soluong) as 'S??? L?????ng B??n ???????c'
from nhanvien nv, dondathang ddh, chitietdathang ctdh
where nv.manhanvien = ddh.manhanvien and ddh.sohoadon = ctdh.sohoadon
group by nv.manhanvien,ho,ten
having sum(soluong) >= all(select sum(soluong)
from nhanvien nv, dondathang ddh, chitietdathang ctdh
where nv.manhanvien = ddh.manhanvien and ddh.sohoadon = ctdh.sohoadon
group by nv.manhanvien,ho,ten);

-- 9.	T??ng ph??? c???p l??n b???ng 50% l????ng cho nh???ng nh??n vi??n b??n ???????c h??ng nhi???u nh???t
update nhanvien set nhanvien.phucap = (luongcoban+phucap)/2 
where manhanvien in (select manhanvien from dondathang, chitietdathang 
where dondathang.sohoadon = chitietdathang.sohoadon
group by manhanvien
having sum(soluong) >= all
(select sum(soluong)
from dondathang , chitietdathang
where dondathang.sohoadon = chitietdathang.sohoadon
group by manhanvien));

-- Th??ng k?? trong n??m 2006 m???i m???t m???t h??ng trong m???i th??ng v?? trong c??? n??m b??n ???????c v???i s??? l?????ng bao nhi??u
-- (Y??u c???u k???t qu??? hi???u th??? d?????i d???ng b???ng, hai c???t ?????u l?? m?? h??ng, t??n h??ng, c??c c???t c??n l???i t????ng ???ng t??? th??ng 1 
--  ?????n th??ng 12 v?? c??? n??m. Nh?? v???y m???i d??ng trong k???t qu??? cho bi???t s??? l?????ng h??ng b??n ???????c m???i th??ng v?? trong c??? n??m c???a m???i m???t h??ng
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
sum(ctdh.soluong) as 'C??? N??m'
from (dondathang ddh inner join chitietdathang ctdh on ddh.sohoadon = ctdh.sohoadon)
inner join mathang mh on ctdh.mahang = mh.mahang
where year(ngaydathang) = 2022
group by ctdh.mahang,tenhang;