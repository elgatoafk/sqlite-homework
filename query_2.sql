SELECT students.student, AVG(marks.mark) AS average_mark
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON marks.subject_id = subjects.id
WHERE subjects.id = 3
GROUP BY students.id
ORDER BY average_mark DESC
LIMIT 1;
