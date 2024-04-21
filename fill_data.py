from faker import Faker
from random import randint
import sqlite3

fake = Faker('uk_UA')

NUMBER_STUDENTS = 43
NUMBER_GROUPS = 3
NUMBER_SUBJECTS = 8
NUMBER_TEACHERS = 5
NUMBER_MARKS = 20



def post_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_GROUPS, NUMBER_SUBJECTS, NUMBER_MARKS):
    conn=sqlite3.connect("uni.db")
    cursor = conn.cursor()

    for _ in range(NUMBER_GROUPS):
        group_name = fake.word()
        cursor.execute("INSERT INTO groups (group_name) VALUES(?)", (group_name,))
    
    for _ in range(NUMBER_STUDENTS):
        student = fake.name()
        group_id = randint(1, NUMBER_GROUPS)
        cursor.execute("INSERT INTO students (student, group_id) VALUES (?, ?)", (student, group_id))
    
    for _ in range(NUMBER_TEACHERS):
        teacher = fake.name()
        cursor.execute("INSERT INTO teachers (teacher) VALUES(?)", (teacher,))

    for _ in range(NUMBER_SUBJECTS):
        subject = fake.word()
        teacher_id = randint(1, NUMBER_TEACHERS)
        cursor.execute("INSERT INTO subjects (subject, teacher_id) VALUES (?, ?)", (subject, teacher_id))
    
    for student_id in range(1, NUMBER_STUDENTS + 1):
        for _ in range(NUMBER_MARKS):
            subject_id = randint(1, NUMBER_SUBJECTS)
            mark = randint(0, 100)
            date = fake.date_this_year()
            cursor.execute("INSERT INTO marks (student_id, subject_id, mark, date_of) VALUES (?, ?, ?, ?)", (student_id, subject_id, mark, date))

    
    conn.commit()
    conn.close()
    print("Data posted, see ya")


if __name__ == "__main__":
    post_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_GROUPS, NUMBER_SUBJECTS, NUMBER_MARKS)





    