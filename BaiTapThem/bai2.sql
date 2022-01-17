CREATE TABLE `student-management`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `sex` INT NOT NULL DEFAULT 1,
  `age` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `IdClass` INT,
  PRIMARY KEY (`id`),
  CONSTRAINT checkAge CHECK (age > 18 AND age < 25),
  CONSTRAINT lienket FOREIGN KEY (IdClass) REFERENCES class(idclass),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
CREATE TABLE `student-management`.`class` (
  `idclass` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idclass`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);
  
  INSERT INTO `student-management`.`class` (`name`) VALUES ('C921H1');
INSERT INTO `student-management`.`class` (`name`) VALUES ('C821H1');
INSERT INTO `student-management`.`class` (`name`) VALUES ('C721H1');
INSERT INTO `student-management`.`class` (`name`) VALUES ('C621H1');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Nam', 'HN', '1', '22', 'namnam1', '0999', '2');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Huyen', 'NB', '0', '23', 'namnam2', '0999', '4');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Hung', 'LC', '1', '20', 'namnam3', '0999', '2');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Manh', 'HN', '1', '19', 'namnam4', '0999', '5');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Long', 'DN', '1', '19', 'namnam5', '0999', '2');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Tuyen', 'SG', '1', '24', 'namnam6', '0999', '1');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Cuong', 'YB', '1', '20', 'namnam7', '0999', '4');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Mai', 'HP', '0', '21', 'namnam8', '0999', '3');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Duc', 'HD', '1', '24', 'namnam9', '0999', '3');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Hao', 'HB', '1', '20', 'namnam10', '0999', '1');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Tien', 'HT', '1', '22', 'namnam11', '0999', '2');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Kien', 'HN', '1', '19', 'namnam12', '0999', '5');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Kien', 'HN', '1', '15', 'namnam13', '0999', '5');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Kiet', 'NB', '1', '23', 'namnam14', '0999', '5');
INSERT INTO `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) VALUES ('Viet', 'PT', '1', '24', 'namnam15', '0999', '3');

insert into `student-management`.`students` (`name`, `address`, `sex`, `age`, `email`, `phone`, `IdClass`) values 
('Toàn', 'QN', '1', '22', 'toan@codegym.vn', '0326156727', '1'),
('Như Anh', 'TB', '1', '23', 'nhuanh@codegym.vn', '0326456727', '2'),
('C Kiều Anh', 'HN', '1', '23', 'kieuanh@codegym.vn', '0334105727', '3'),
('A Hoàng', 'HN', '1', '24', 'hoang@codegym.vn', '0326876727', '4'),
('Luân', 'HN', '1', '24', 'luan@codegym.vn', '0326198727', '5');

SELECT * FROM `student-management`.`students`;
SELECT * FROM `student-management`.`students` WHERE (sex = 1);
SELECT * FROM `student-management`.`students` WHERE (age < 20);
SELECT * FROM `student-management`.`students` WHERE (address LIKE 'HN' OR address LIKE 'DN' OR address LIKE 'LC');
SELECT * FROM `student-management`.`students` WHERE (address NOT LIKE 'HN');
SELECT * FROM `student-management`.`students` WHERE (name LIKE 'H%');
SELECT * FROM `student-management`.`students` WHERE (name LIKE 'Anh');

-- Hiển thị danh sách tuổi giảm dần !!! 
SELECT * FROM `student-management`.`students` ORDER BY age DESC LIMIT 5;

-- Hiển thị danh sách theo tuổi tăng dần !!! 
SELECT * FROM `student-management`.`students` ORDER BY age ASC LIMIT 5;

-- Hiển thị số lượng học sinh theo lớp .
SELECT students.IdClass, class.name, COUNT(students.id) AS 'Số lượng học sinh là : '
FROM `student-management`.`students`,`student-management`.`class`
where students.IdClass = class.idclass
group by students.IdClass, class.name;

-- Hiển thị lớp đông sinh viên nhất !!!
select cl.name as 'Lớp đông sinh viên nhất là : '
from `student-management`.students st,`student-management`.class cl
where st.IdClass = cl.idclass
group by st.IdClass, cl.idclass
having count(cl.name) >= (select max(t.tong)
from (
select count(id) as tong
from `student-management`.students
group by idclass)
as t
);

-- Hiển thị lớp ít học sinh nhất 
select cl.name as 'Lớp ít sinh viên nhất là : '
from `student-management`.students st,`student-management`.class cl
where st.IdClass = cl.idclass
group by st.IdClass, cl.idclass
having count(cl.name) <= (select min(t.tong)
from (
select count(id) as tong
from `student-management`.students
group by idclass)
as t
);

-- Thống kê sinh viên theo địa chỉ
select students.address, count(*) as 'Số Lượng Học Sinh'
from `student-management`.students
group by students.address
having count(*) >= 1;

-- Hiển thị những lớp có học viên > 3 Biến thể vì không lớp nào hơn 5 @@
SELECT students.IdClass, class.name, COUNT(*) AS 'Số lượng học sinh: '
FROM `student-management`.`students`,`student-management`.`class`
where students.IdClass = class.idclass
group by students.IdClass, class.name
having COUNT(*) >= 3;

--  Hiển thị thành phố có học viên lớn hơn 2
select students.address , count(students.address) as 'so luong hoc sinh'
from `student-management`.`students`
group by students.address
having count(students.address) >= 2;

--  Tìm học viên lớn tuổi nhất
select students.name, students.age from `student-management`.students
where age = (select max(age) from `student-management`.students);

-- Hiển thị học viên có tuổi nhỏ nhất
select students.name, students.age from `student-management`.students
where age = (select min(age) from `student-management`.students);

-- Xóa tất cả ae nhà ở Phố Cổ
delete  FROM `student-management`.students where address = 'HN';

-- Cập nhật thông tin của học viên có quê ở Hà Nội thành giới tính nữ
-- Nếu tắt cái xóa hoặc update an toàn thì đỡ phải set :v 
UPDATE `student-management`.`students` SET `sex` = '0' WHERE id in (
select id from `student-management`.`students` where (address like 'HN'));

-- Tìm tuổi lớn thứ 2
 select students.name, students.age 
 from `student-management`.students
  where age = (select max(age)
 from `student-management`.students
 where age < (select max(age) from `student-management`.students));
 
 -- Tìm tuổi bé thứ 2
  select students.name, students.age 
 from `student-management`.students
  where age = (select min(age)
 from `student-management`.students
 where age > (select min(age) from `student-management`.students));