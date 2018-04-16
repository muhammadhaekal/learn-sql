-- create new db
create database company;

-- show db list
show databases;


-- use specific db
use company;

-- this is a comment
/* this is also a comment */


-- Create Table Employee
create table employees (
	emp_no int(11) not null auto_increment,
    first_name varchar(20) not null,
    last_name varchar(20) not null, 
    gender varchar(1) not null,
    birth_date date not null,
    hire_date date not null,
    primary key(emp_no)
);

-- drop table  
drop table employees;

-- insert data
insert into employees 
(first_name,last_name,gender,birth_date,hire_date) 
values 
('Muhammad', 'Juki', 'M','2000-12-30', '2018-01-12');
-- ('Fahri', 'Hakim', 'M','2000-12-30', '2000-01-12');

-- select 
select * from employees;

-- update data
update employees set last_name = 'Abdul' where emp_no = 2;

-- Create table salaries
create table salaries (
	emp_no int(11) not null,
    salary int(11) not null,
    from_date date not null,
    to_date date not null,
    primary key(emp_no,from_date),
    constraint salaries_fk_1 foreign key(emp_no) references employees (emp_no)
);

-- insert statement template
INSERT INTO `company`.`salaries`
(`emp_no`,
`salary`,
`from_date`,
`to_date`)
VALUES
(<{emp_no: }>,
<{salary: }>,
<{from_date: }>,
<{to_date: }>);

-- insert statement
INSERT INTO `company`.`salaries`
(`emp_no`,
`salary`,
`from_date`,
`to_date`)
VALUES
(1,
3000000,
'2014-04-04',
'2016-04-04');


-- select to table salaries
select * from salaries;
select emp_no,from_date from salaries;
select * from employees;

-- select with where clause
select emp_no,first_name,last_name from employees where emp_no > 1;
select first_name,last_name,hire_date from employees where hire_date < '2018-01-01';
select * from employees;

-- desc table
desc employees;

select * from salaries;
select * from employees;
-- join 
select * from employees e left join salaries s on e.emp_no = s.emp_no;
select e.emp_no,e.first_name,e.last_name,s.salary,s.from_date from employees  e
inner join salaries s 
on e.emp_no = s.emp_no;

-- order by example 
select e.emp_no,e.first_name,s.salary,s.from_date,s.to_date from employees e,salaries s 
where e.emp_no = s.emp_no  order by s.from_date ;

-- sum example
select sum(salary) from salaries where emp_no =1;
select avg(salary) from salaries where emp_no =1;

-- alter table 
ALTER TABLE salaries ADD COLUMN test INT DEFAULT 100;

-- where clause
select * from employees 
where (last_name = 'hakim' or last_name = 'juki') 
and hire_date > '2000-12-12';

select * from employees;








