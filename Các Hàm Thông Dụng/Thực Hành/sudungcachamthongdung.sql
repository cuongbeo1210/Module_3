-- Hiển thị số lượng sinh viên từng nơi ở
select student.Address , count(*) as ' Số Lượng Sinh Viên '
from student
group by student.Address;

-- Tính điểm trung bình các môn học của mỗi học viên
select *, avg(Mark)
from student join mark on student.StudentId = mark.StudentId
group by student.StudentId;

-- Hiển thị những bạn có điểm TB > 10
select *, avg(Mark)
from student join mark on student.StudentId = mark.StudentId
group by student.StudentId
having avg(Mark) > 10;

-- Hiển thị thông tin các sinh viên có điểm trung bình lớn nhất
select student.StudentId, student.StudentName, avg(Mark) as 'Điểm Trung Bình'
from student join mark on student.StudentId = mark.StudentId
group by student.StudentId, student.StudentName
having avg(Mark) >= all (select avg(Mark) from mark group by mark.StudentId);