-- Bước 1: Sử dụng câu lệnh Use QuanLySinhVien để sử dụng cơ sở dữ liệu:
USE QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM subject
GROUP BY Credit
HAVING AVG(Credit) > all (SELECT AVG(Credit) FROM Subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT Sub.SubName, AVG(Mark)
FROM Subject Sub JOIN Mark M
ON Sub.SubId = M.SubId
GROUP BY Sub.SubName
HAVING AVG(Mark) >= all (SELECT AVG(Mark) FROM Mark GROUP BY Mark.SubID);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.*, AVG(Mark) AS AVGPOINT
FROM Student S LEFT JOIN Mark M
ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AVGPOINT DESC;