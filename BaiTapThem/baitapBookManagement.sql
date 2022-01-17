-- Tạo dữ liệu với 10 bản ghi khác nhau
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Miếng Da Bò', '12000', '3', 'Tiểu Thuyết', 'Alexander', '1999/06/20');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Doraemon', '9000', '6', 'Truyện Tranh', 'Fujio', '1969/12/21');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Những Người Khốn Khổ', '15000', '5', 'Tiểu Thuyết', 'Victor Hugo', '1862/06/17');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Đắc Nhân Tâm', '17000', '4', 'Tự Lực', 'Dale Carnegie', '1936/08/12');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Conan', '11000', '2', 'Truyện Tranh', 'Aoyama Gosho', '1994/05/11');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Gen Vị Kỷ', '13000', '4', 'Khoa Học', 'Richard Dawkins', '2019/11/01');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Thép Đã Tôi Thế Đấy', '16000', '5', 'Tiểu Thuyết', 'Nikolai Alekseyevich Ostrovsky', '1934/09/22');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Nhật Ký Trong Tù', '18000', '7', 'Nhật Ký', 'Bác Hồ Vĩ Đại', '1943/09/10');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Truyện Kiều', '16500', '6', 'Truyện Thơ', 'Nguyễn Du', '1820/05/23');
INSERT INTO `book_management`.`book` (`name`, `price`, `quantity`, `type`, `author`, `date`) VALUES ('Từ Ấy', '14000', '3', 'Thơ', 'Tố Hữu', '1946/03/21');

-- Tạo phương thức để hiển thị tất cả quyển sách
select * from book_management.book;

-- Tạo phương thức tính tổng giá tiền của tất cả sách trong mảng
select sum(quantity * price) as 'Tổng Giá Tiền Sách '
from book_management.book;

 --  Tạo phương thức tìm quyển sách có đơn giá cao nhất 
select name, price from book_management.book
where price = (select max(price) from book_management.book);
 
-- Tạo phương thức tìm quyển sách đơn giá thấp nhất
select name, price from book_management.book
where price = (select min(price) from book_management.book);

-- Tạo phương thức tính đơn giá trung bình của sách khoa học
select avg(price) as 'Đơn Giá Trung Bình'
from book_management.book
where type = 'Khoa Học';

-- Tạo phương thức trả về tất cả các quyển sách của tác giả 
select * from book_management.book
where author = 'Victor Hugo';

-- Tạo phương thức trả về tất cả các quyển sách trong khoảng giá
select * from book_management.book
where (price > 9000 and price < 13000);

-- Tạo phương thức trả về tất cả các quyển sách thuộc 1 thể loại 
select * from book_management.book
where type = 'Tiểu Thuyết';

-- Tạo phương thức trả về tất cả các quyển sách theo giá tiền
select * from book_management.book
where price = 13000;

-- Tạo phương thức trả về tất cả các quyển sách theo ngày
select * from book_management.book
where day(date) = 23;

-- Tạo phương thức trả về tất cả các quyển sách theo khoảng ngày
select * from book_management.book
where (day(date) < 23 and day(date) > 15);