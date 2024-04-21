SELECT DISTINCT subjects.subject
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON marks.subject_id = subjects.id
WHERE students.id = 43