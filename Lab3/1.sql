--1.a
select *
from course
where credits > 3;
--1.b
select *
from classroom
where building = 'Watson'
  or building = 'Packard';
--1.с
select *
from course
where dept_name = 'Comp. Sci.';
--1.d
select *
from course, section
where course.course_id = section.course_id
  and section.semester = 'Fall';
--1.e
select *
from student
where tot_cred > 45
  and tot_cred < 90;
--1.f
select *
from student
where name like '%a'
    or name like '%e'
    or name like '%y'
    or name like '%u'
    or name like '%i'
    or name like '%o';
--1.g
select *
from course, prereq
where course.course_id = prereq.course_id
  and prereq_id = 'CS-101';