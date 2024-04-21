-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(255) UNIQUE NOT NULL
    
);

-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student VARCHAR(255) UNIQUE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher VARCHAR(255) UNIQUE NOT NULL
);


-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject VARCHAR(255) UNIQUE NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- Table: marks
DROP TABLE IF EXISTS marks;
CREATE TABLE marks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    mark TINYINT UNSIGNED NOT NULL,
    date_of DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

