SELECT AVG(marks.mark) AS average_mark
FROM marks
JOIN subjects ON marks.subject_id = subjects.id
JOIN teachers ON subjects.teacher_id = teachers.id
WHERE teachers.id = 3