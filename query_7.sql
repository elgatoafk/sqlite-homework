SELECT students.student, marks.mark, marks.date_of
FROM students
JOIN marks ON students.id = marks.student_id
JOIN subjects ON marks.subject_id = subjects.id
JOIN groups ON students.group_id = groups.id
WHERE groups.id = 2 AND subjects.id = 3
