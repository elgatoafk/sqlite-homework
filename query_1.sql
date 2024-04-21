SELECT students.student, AVG(marks.mark) AS average_mark
FROM students
JOIN marks ON students.id = marks.student_id
GROUP BY students.id
ORDER BY average_mark DESC
LIMIT 5;