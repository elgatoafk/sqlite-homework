SELECT groups.group_name, AVG(marks.mark) AS average_mark
FROM groups
JOIN students ON groups.id = students.group_id
JOIN marks ON students.id = marks.student_id
JOIN subjects ON marks.subject_id = subjects.id
WHERE subjects.id = 1
GROUP BY groups.id;
