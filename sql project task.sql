use Project
select * from Employee

create table Dept(EmployeeNumber int,Gender varchar(20),Department varchar(30),DailyRate int)

insert into Dept values(5,'Male','Hardware',800),
						(7,'Male','Support',570),
					    (88,'Female','Sales',8600),
						(30,'Male','Hardware',32),
						(76,'Female','Software',7200)							
select * from Dept

--use merge for upsert
	merge Dept as target
	using Employee as source
	on source.EmployeeNumber=target.EmployeeNumber

when matched then
	update set target.Gender=source.Gender

when not matched by target then
     insert(EmployeeNumber,Gender,Department,DailyRate)
	values(source.EmployeeNumber,source.Gender,source.Department,source.DailyRate)

when not matched by source then
delete;

select * from Dept where Department='Software'

update Employee set Gender='Male' where EmployeeNumber=88

insert into Dept values(101,'Female','Networking',500)

delete Employee where EmployeeNumber=87



