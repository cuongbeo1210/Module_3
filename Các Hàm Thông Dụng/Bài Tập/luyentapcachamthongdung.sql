-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject
where Credit = (select max(Credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.SubName, mark.Mark from subject join mark on subject.SubId = mark.SubId
where mark.Mark = (select max(Mark) from mark)
group by subject.SubName;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.StudentName,  avg(Mark) as 'Điểm Trung Bình'
from mark join student on mark.StudentId = student.StudentId
group by student.StudentId
order by avg(Mark) desc;