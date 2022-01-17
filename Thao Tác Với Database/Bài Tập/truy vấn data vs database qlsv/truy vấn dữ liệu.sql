-- Hiển thị tất cả sinh viên có tên bắt đầu bằng ký tự 'H'
select * from student where StudentName like 'h%';

-- Hiển thị thông tin các lớp học bắt đầu vào tháng 12
select * from class where month(StartDate) = 12;

-- Hiển thị các thông tin môn học có credit trong khoảng từ 3-5
select * from subject where (Credit >= 3 and Credit <= 5);

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
update student set ClassId = 2 where StudentName = 'Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select StudentName , Mark from mark right join student on mark.StudentId = student.StudentId
order by Mark desc, StudentName;