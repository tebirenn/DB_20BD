CREATE TABLE students(
    full_name varchar PRIMARY KEY ,
    age integer NOT NULL,
    birth_date date,
    gender varchar(7),
    avg_grade float NOT NULL,
    info text,
    need_dormitory boolean NOT NULL,
    additional_info text NOT NULL
);

CREATE TABLE instructors(
    full_name varchar PRIMARY KEY,
    work_ex text NOT NULL,
    remote_lessons boolean NOT NULL
);

CREATE TABLE lesson(
    inst_id varchar references instructors(full_name),
    stud_id varchar references students(full_name),
    room_numb integer CHECK ( room_numb > 0 )
);