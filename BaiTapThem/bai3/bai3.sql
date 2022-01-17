-- Liệt kê những dòng xe có chỗ ngồi > 5
select dongxe.DongXe, dongxe.SoChoNgoi
from bai_tap.dongxe
where dongxe.SoChoNgoi > 5;

-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
select distinct N.* 
from dongxe D inner join dangkycungcap DC on D.DongXe = DC.DongXe
inner join nhacungcap N on N.MaNhaCC = DC.MaNhaCC
inner join mucphi M on M.MaMP = DC.MaMP
where (D.HangXe = 'Toyota' and M.DonGia = 15000)
or (D.HangXe = 'Kia' and M.DonGia = 20000);

-- Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế
select * from nhacungcap
order by TenNhaCC asc, MaSoThue desc;

-- Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”
select MaNhaCC, count(MaDKCC) as SoLanDangKy
from dangkycungcap
where NgayBatDauCungCap = '2015-11-20'
group by MaNhaCC;

-- Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select distinct HangXe
from dongxe;

-- Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
-- HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
-- tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
-- tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra
select DK.MaDKCC, NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi, NCC.MaSoThue, DV.TenLoaiDV
from nhacungcap NCC left join dangkycungcap DK on DK.MaNhaCC = NCC.MaNhaCC
left join loaidichvu DV on DK.MaLoaiDV = DV.MaLoaiDV;

-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
-- thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
select distinct NCC.*
from dangkycungcap DK inner join dongxe DX on DK.DongXe = DX.DongXe
inner join nhacungcap NCC on DK.MaNhaCC = NCC.MaNhaCC
where DX.DongXe in ('Hiace','Cerato');

-- Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả
select * from NHACUNGCAP NCC
where not exists (select MaNhaCC from dangkycungcap where MaNhaCC = NCC.MaNhaCC);

