DROP DATABASE spring_jpa;

CREATE DATABASE master_service;

CREATE DATABASE student_service;

USE master_service;

USE student_service;

select firstname, dateofbirth
from stannes_mary.student_registration 
where month(dateofbirth) = 5 order by dateofbirth;

select firstname,dateofbirth
from stannes_mary.student_registration 
where dayofyear(NOW()) -  dayofyear(dateofbirth) Between 0 AND 15 
OR dayofyear(dateofbirth) - dayofyear(Now()) > 351 order by dateofbirth;


select firstname
from stannes_mary.student_registration 
where month(dateofbirth) = month(now()) and day(dateofbirth) = day(now());

use master_service;

TRUNCATE TABLE master_service.academic_year_details;

DROP DATABASE master_service;

CREATE DATABASE master_service;

TRUNCATE TABLE master_service.academic_year_tbl;

DROP TABLE master_service.specialization_tbl;

USE stannes_mary;

update stannes_mary.campus_user set isActive = 'N' where timestampdiff(second, createdate, now()) > 900;