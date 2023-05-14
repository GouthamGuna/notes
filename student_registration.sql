SELECT * FROM stannes_mary.student_registration;


select * from stannes_mary.student_registrationnotice_boardnotice_boardnotice_board
where DATEPART(wk, dateofbirth) = DATEPART(wk, GETDATE()) and
DATEPART(yy, dateofbirth) = DATEPART(yy, GETDATE());


select firstname, dateofbirth, curdate(),TIMESTAMP(YEAR,dateofbirth,CURDATE()) As age
from stannes_mary.student_registration order by firstname;

select firstname, dateofbirth
from stannes_mary.student_registration 
where month(dateofbirth) = 5 order by dateofbirth;


select firstname,dateofbirth
from stannes_mary.student_registration 
where dayofyear(NOW()) -  dayofyear(dateofbirth) Between 0 AND 15 
OR dayofyear(dateofbirth) - dayofyear(Now()) > 351 order by dateofbirth;


select firstname
from stannes_mary.student_registration 
where date_format(From_UNIXTIME(dateofbirth), '%m-%d') = date_format(Now(), '%m-%d');




select firstname
from stannes_mary.student_registration 
where month(dateofbirth) = month(now()) and day(dateofbirth) = day(now());
