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
('To??n', 'QN', '1', '22', 'toan@codegym.vn', '0326156727', '1'),
('Nh?? Anh', 'TB', '1', '23', 'nhuanh@codegym.vn', '0326456727', '2'),
('C Ki???u Anh', 'HN', '1', '23', 'kieuanh@codegym.vn', '0334105727', '3'),
('A Ho??ng', 'HN', '1', '24', 'hoang@codegym.vn', '0326876727', '4'),
('Lu??n', 'HN', '1', '24', 'luan@codegym.vn', '0326198727', '5');

SELECT * FROM `student-management`.`students`;
SELECT * FROM `student-management`.`students` WHERE (sex = 1);
SELECT * FROM `student-management`.`students` WHERE (age < 20);
SELECT * FROM `student-management`.`students` WHERE (address LIKE 'HN' OR address LIKE 'DN' OR address LIKE 'LC');
SELECT * FROM `student-management`.`students` WHERE (address NOT LIKE 'HN');
SELECT * FROM `student-management`.`students` WHERE (name LIKE 'H%');
SELECT * FROM `student-management`.`students` WHERE (name LIKE 'Anh');

-- Hi???n th??? danh s??ch tu???i gi???m d???n !!! 
SELECT * FROM `student-management`.`students` ORDER BY age DESC LIMIT 5;

-- Hi???n th??? danh s??ch theo tu???i t??ng d???n !!! 
SELECT * FROM `student-management`.`students` ORDER BY age ASC LIMIT 5;

-- Hi???n th??? s??? l?????ng h???c sinh theo l???p .
SELECT students.IdClass, class.name, COUNT(students.id) AS 'S??? l?????ng h???c sinh l?? : '
FROM `student-management`.`students`,`student-management`.`class`
where students.IdClass = class.idclass
group by students.IdClass, class.name;

-- Hi???n th??? l???p ????ng sinh vi??n nh???t !!!
select cl.name as 'L???p ????ng sinh vi??n nh???t l?? : '
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

-- Hi???n th??? l???p ??t h???c sinh nh???t 
select cl.name as 'L???p ??t sinh vi??n nh???t l?? : '
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

-- Th???ng k?? sinh vi??n theo ?????a ch???
select students.address, count(*) as 'S??? L?????ng H???c Sinh'
from `student-management`.students
group by students.address
having count(*) >= 1;

-- Hi???n th??? nh???ng l???p c?? h???c vi??n > 3 Bi???n th??? v?? kh??ng l???p n??o h??n 5 @@
SELECT students.IdClass, class.name, COUNT(*) AS 'S??? l?????ng h???c sinh: '
FROM `student-management`.`students`,`student-management`.`class`
where students.IdClass = class.idclass
group by students.IdClass, class.name
having COUNT(*) >= 3;

--  Hi???n th??? th??nh ph??? c?? h???c vi??n l???n h??n 2
select students.address , count(students.address) as 'so luong hoc sinh'
from `student-management`.`students`
group by students.address
having count(students.address) >= 2;

--  T??m h???c vi??n l???n tu???i nh???t
select students.name, students.age from `student-management`.students
where age = (select max(age) from `student-management`.students);

-- Hi???n th??? h???c vi??n c?? tu???i nh??? nh???t
select students.name, students.age from `student-management`.students
where age = (select min(age) from `student-management`.students);

-- X??a t???t c??? ae nh?? ??? Ph??? C???
delete  FROM `student-management`.students where address = 'HN';

-- C???p nh???t th??ng tin c???a h???c vi??n c?? qu?? ??? H?? N???i th??nh gi???i t??nh n???
-- N???u t???t c??i x??a ho???c update an to??n th?? ????? ph???i set :v 
UPDATE `student-management`.`students` SET `sex` = '0' WHERE id in (
select id from `student-management`.`students` where (address like 'HN'));

-- T??m tu???i l???n th??? 2
 select students.name, students.age 
 from `student-management`.students
  where age = (select max(age)
 from `student-management`.students
 where age < (select max(age) from `student-management`.students));
 
 -- T??m tu???i b?? th??? 2
  select students.name, students.age 
 from `student-management`.students
  where age = (select min(age)
 from `student-management`.students
 where age > (select min(age) from `student-management`.students));