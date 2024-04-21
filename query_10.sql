SELECT DISTINCT subjects.subject
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON marks.subject_id = subjects.id
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE students.id = 2 AND teachers.id = 3