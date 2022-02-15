--college_clinic_database

create database college_clinic_database;
use college_clinic_database;
 


 
--creating tables for different entities and their relationship


create table Student(
student_id int primary key,
First_name varchar(20) not null,
Middle_name varchar(20),
Last_name varchar(20),
mob_num int,
dept varchar(50),
DOB datetime,
emerCont_name varchar(50),
emerCont_mobnum int not null 
);



create table lab_technician(
Employee_ID int primary key,
 first_name varchar(20),
 middle_name varchar(20),
 last_name varchar(20),
 mob_num int 
);


create table pharmacist(
Employee_ID int primary key,
 first_name varchar(20),
 middle_name varchar(20),
 last_name varchar(20),
 mob_num int 
);


create table health_professional(
Employee_ID int primary key,
 first_name varchar(20),
 middle_name varchar(20),
 last_name varchar(20),
 mob_num int 
);




create table medicine(
medicine_id int primary key,
employee_id int,
medicine_name varchar(50),
FOREIGN KEY(employee_ID) REFERENCES pharmacist(Employee_ID)
 );


create table lab_test(
test_id int primary key  ,
Employee_ID int,
test_name varchar(50),
test_result varchar(50),
 FOREIGN KEY(Employee_ID) REFERENCES lab_technician(Employee_ID)
);



create table treat(
medicine_id int,
test_id int,
student_id int,
Employee_ID int,
Date datetime,
treatment_no int ,
FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id),
FOREIGN KEY(test_id) REFERENCES lab_test(test_id),
FOREIGN KEY(student_id) REFERENCES Student(student_id),
FOREIGN KEY(Employee_ID) REFERENCES health_professional(Employee_ID)
);  
  
 --to calculate age of students
 select timestampdiff(YEAR,date_of_birth,now()) AS AGE from student;
  
  
--to insert values


insert into health_professional(
Employee_ID ,
 first_name ,
 middle_name,
 last_name ,
 mob_num 
)
values
(01,'Selam','anteneh','manalebachew',0912431234),
(02,'sifan','worku','gemechis',0986832123),
(03,'tesema','hailu','abera',0975930282),
(04,'Semehal','mohammed','abera',0973829027),
(05,'abdurhaman','selhadin','gizachew',0962819352);



insert into Student(
student_id ,
First_name ,
Middle_name,
Last_name,
mob_num ,
dept ,
DOB,
emerCont_name,
emerCont_mobnum
) 
values
(01,'Abel','Hailemichael','Dejene',0949327898, 'Computer science','2001-08-10 00:00:00','GETE',0943213413),
(02,'Kalkidan','michaelneh','Dejashu',0985345882, 'Computer science','2001-02-10 00:00:00','abebe', 0962658789),
(03,'eldana','iteyaa','kibrom',0965485632, 'chemistry','2001-04-2 00:00:00','abebe', 0962658789),
(04,'bekelech','Hailu','Debebe',0946245888, 'biology','2001-04-23 00:00:00','abebe', 0962658789),
(05,'Alazar','lemechaa','markos',0984989313, 'sport science','2001-7-10 00:00:00','abebe', 0962658789);




insert into lab_technician(
Employee_ID ,
 first_name ,
 middle_name,
 last_name ,
 mob_num 
)
values
(01,'Abebe','anteneh','manalebachew',0918478234),
(02,'sifan','worku','gemechis',0986832123),
(03,'sara','mekbib','bekele',0975930282);


insert into pharmacist(
Employee_ID ,
 first_name ,
 middle_name,
 last_name ,
 mob_num 
)
values
(01,'selamawit','dhuguma','gadise',0965457825 ),
 (02,'helen','yared','abera',0932154789 )
 ;
 

insert into medicine(

medicine_id ,
employee_id ,
medicine_name )
values
(01,01,'paracetamol,amoxacilin'),
(02,01,'ibuprofen');




insert into lab_test(
test_id   ,
Employee_ID ,
test_name,
test_result )
values
(01,02,'HIV-blood test', 'positive'),
(02,01,'malaria test', 'negative'),
(03,02,'corona test', 'positive'),
(04,03,'thapoid test', 'negative');


insert into treat(
medicine_id ,
test_id ,
student_id ,
Employee_ID ,
Date ,
treatment_no)
values
(01,02,01,01,'2021-01-12',01),
(02,03,03,01,'2021-02-20',02);

select Student.First_name from Student JOIN treat on(Student.student_id = treat.student_id);



  
