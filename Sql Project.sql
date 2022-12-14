create database Project
use Project

	create table Orders(ord_no int not null,purch_amt money,ord_date date,customer_id int,salesman_id int)


insert into Orders values
	(70001, 150.5, '2012-10-05', 3005, 5002),
	(70009, 270.65, '2012-09-10', 3001, 5005),
	(70002, 65.26, '2012-10-05', 3002, 5001),
	(70004, 110.5, '2012-08-17', 3009, 5003),
	(70007, 948.5, '2012-09-10', 3005, 5002),
	(70005, 2400.6, '2012-07-27', 3007, 5001),
	(70008, 5760, '2012-09-10', 3002, 5001),
	(70010, 1983.43, '2012-10-10', 3004, 5006),
	(70003, 2480.1, '2012-10-10', 3009, 5003),
	(70012, 250.45, '2012-06-27', 3008, 5002),
	(70011, 75.29, '2012-08-17', 3003, 5007),
	(70013, 3045.6, '2012-04-25', 3002, 5001)

create table Customers(Customer_id int not null,cust_name varchar(50),city Varchar(20),grade int,salesman_id int)


insert into Customers values
	(3002,'Nick Rimando','New york',100,5001),
	(3007,'Brad Davis','New york',200,5001),
	(3005,'Graham Zusi','California',200,5002),
	(3008,'Julian Green','London',300,5002),
	(3004,'Fabian Johnson','Paris',300,5006),
	(3009,'Geoff Cameron','Berlin',300,5003),
	(3003,'Jozy Altidor','Moscow',200,5007),
	(3001,'Brad Guzan','London',Null,5005)

create table Salesman(name varchar(30),city varchar(20),commission decimal(3,2),salesman_id int not null)


insert into Salesman values 
	('James Hoog','New York',0.15,5001),
	('Nail Knite','Paris',0.13,5002),
	('Lauson Hen','San Jose',0.12,5003),
	('Pit Alex','London', 0.11,5005),
	('Mc lyon','Paris', 0.14,5006),
	('Paul Adam','Rome',0.13,5007)

select * from Customers
select * from Salesman
select * from Orders

create procedure sp_Cust
as
begin
	select c.cust_name as Customer,c.grade,
	s.name as Salesman,
	o.ord_no,o.purch_amt
	from Customers c
	right join salesman s
	on c.salesman_id=s.salesman_id
	left join orders o
	on c.Customer_id=o.customer_id
	where o.purch_amt>2000
	and c.grade is not null
end

exec sp_Cust


create table New_table
(customer varchar(30),
grade int,salesman varchar(30),
ord_no int not null,
purch_amt money
)


insert into New_table exec sp_Cust
select * from new_table

alter table New_table
ADD Datetiming DATETIME NOT NULL DEFAULT current_timestamp

select * from New_table

insert into New_table(customer,grade,salesman,ord_no,purch_amt) values('Raj',100,'Rahul',7006,3450)

alter table New_table add constraint New_table_order_id primary key(ord_no)

alter procedure sp_Cust
	@customer varchar(30),
	@grade int,
	@salesman varchar(20),
	@ord_no int ,
	@purch_amt money
as
begin
	if exists (select * from New_table where ord_no=@ord_no)
		update New_table set Customer=@Customer,grade=@grade,salesman=@salesman,purch_amt=@purch_amt 
		where ord_no=@ord_no
	else
		insert into New_table(customer,grade,salesman,ord_no,purch_amt) values(@customer,@grade,@salesman,@ord_no,@purch_amt)
end

exec sp_Cust 'Rohit',500,'Hardik',70003,5555
exec sp_Cust 'Adam',150,'Warner',70007,4747
exec sp_Cust 'Mark',200,'Donald',70005,3213
exec sp_Cust 'Rohit',300,'Jatin',70008,4535

select * from New_table

--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
--The customer, may have placed, either one or more orders on or above order amount 2000 and must have a grade, 
--or he may not have placed any order to the associated supplier.


