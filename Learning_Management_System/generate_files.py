import csv
from faker import Faker
import random
from datetime import datetime, timedelta

fake_obj = Faker()

# Total records
record_length = 100

# user file generation
users_file_path = r"Learning_Management_System\users_data.csv"
headers = ["user_id","user_name","user_role","user_email","user_phone"]
roles = ["Admin(Teacher)","Student"]

with open(users_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        user_id = f"USR-{i:04d}"
        user_name = fake_obj.name()
        user_role = random.choice(roles)
        user_email = fake_obj.email()
        user_phone = random.randint(6000000000,9999999999)

        write.writerow([
            user_id,
            user_name,
            user_role,
            user_email,
            user_phone
        ])

# course file generation
courses_file_path = r"Learning_Management_System\courses_data.csv"
headers = ["course_id","title","description"]
prefixes = ['Introduction to', 'Advanced', 'Foundations of', 'Masterclass in', 'Applied']
topics = ['Data Analytics', 'Full-Stack Development', 'Cloud Architecture', 'Cybersecurity', 'Machine Learning']

with open(courses_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        course_id = f"CORS-{i:04d}"
        title = f"{random.choice(prefixes)} {random.choice(topics)}"
        description = course_description = fake_obj.paragraph(nb_sentences=5)

        write.writerow([
            course_id,
            title,
            description
        ])

# lessons file generation
lessons_file_path = r"Learning_Management_System\lessons_data.csv"
headers = ["lesson_id","course_id","title","content"]
verbs = ['Getting Started with', 'Understanding', 'Deep Dive into', 'Mastering', 'Debugging']
nouns = ['Arrays & Objects', 'Git Workflows', 'REST APIs', 'SQL Joins', 'State Management']

with open(lessons_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        lesson_id = f"LES-{i:04d}"
        random_num = random.randint(1,100)
        course_id = f"CORS-{random_num:04d}"
        title = f"{random.choice(verbs)} {random.choice(nouns)}"
        content = fake_obj.sentence(nb_words=12)

        write.writerow([
            lesson_id,
            course_id,
            title,
            content
        ])

# enrollments file generation
enrollment_file_path = r"Learning_Management_System\enrollment_data.csv"
headers = ["enrollment_id","user_id","course_id","enrollment_date"]

with open(enrollment_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        enrollment_id = f"ERL-{i:04d}"
        user_num = random.randint(1,100)
        user_id = f"USR-{user_num:04d}"
        course_num = random.randint(1,100)
        course_id = f"CORS-{course_num:04d}"
        date_time = fake_obj.date_time_between(start_date='-2y', end_date='now') # time between 2 years ago and today
        enrollment_date = date_time.strftime('%Y-%m-%d %H:%M:%S')
        
        write.writerow([
            enrollment_id,
            user_id,
            course_id,
            enrollment_date
        ])

# user activity file generation
user_activity_file_path = r"Learning_Management_System\user_activity_data.csv"
headers = ["activity_id","user_id","lesson_id","activity_status"]
status = ["Not Started","In Progress","Completed"]

with open(user_activity_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        activity_id = f"ACT-{i:04d}"
        user_num = random.randint(1,100)
        user_id = f"USR-{user_num:04d}"
        lesson_num = random.randint(1,100)
        lesson_id = f"LES-{lesson_num:04d}"
        activity_status = random.choice(status)

        write.writerow([
            activity_id,
            user_id,
            lesson_id,
            activity_status
        ])

# assesment file generation
assessment_file_path = r"Learning_Management_System\assessments_data.csv"
headers = ["assessment_id","course_id","max_score"]

with open(assessment_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1,record_length+1):
        assessment_id = f"ASS-{i:04d}"
        course_num = random.randint(1,100)
        course_id = f"CORS-{course_num:04d}"
        max_score = 100

        write.writerow([
            assessment_id,
            course_id,
            max_score
        ])

# assessment submission file generation
submission_file_path = r"Learning_Management_System\assessments_submission_data.csv"
headers = ["submission_id","assessment_id","user_id","score_obtained","submission_date"]

with open(submission_file_path,"w",newline="", encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    start_window = datetime.strptime('2024-06-01', '%Y-%m-%d')
    end_window = datetime.strptime('2026-06-30', '%Y-%m-%d')

    for i in range(1,record_length+1):
        submission_id = f"SUB-{i:04d}"
        assessment_num = random.randint(1,100)
        assessment_id = f"ASS-{assessment_num:04d}"
        user_num = random.randint(1,100)
        user_id = f"USR-{user_num:04d}"
        date_obj = fake_obj.date_time_between(start_date=start_window, end_date=end_window)
        submission_date = date_obj.strftime("%Y-%m-%d")
        score_obtained = random.randint(0,100)

        write.writerow([
            submission_id,
            assessment_id,
            user_id,
            score_obtained,
            submission_date
        ])

print("File generated successfully")