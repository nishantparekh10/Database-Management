create schema invention_managment;
drop table invention_manag;
create table 1_NF (
							invention_id  int ,
                            invention_name varchar(255),
                            year_invention date , 
                            invention_category varchar(255),
                            story varchar(255),
                            inventor_id varchar(100),
                            inventor_name varchar(100),
                            job_type varchar(50),
                            city varchar(100),
                            pincode int,
                            age varchar(10),
                            award_id int,
                            award_name varchar(255),
                            jury_id varchar(10),
                            jury_name varchar(100)
                            );
 delete from invention_manag where invention_id=1;                           
insert into invention_manag values(1 , 'autonomous cars' , '2017-03-16' , 'automated system','abc','I1,I2','ahnaan,nishant','student,student','17,17',101,'best tech','J1','dr suresh patel');
insert into invention_manag values(2 , 'automatic web design' , '2016-07-03' , 'automated system','def','I3','vijay S','student','16',102,'best tool for development','J2','dr kritika singh');
insert into invention_manag values(3 , 'text processing' , '2019-08-26' , 'AI','dd','I4','anshul','student','20',103,'best potention student','J3','mike rooney');
insert into invention_manag values(4 , 'sales prediction' , '2020-03-06' , 'ML','aeec','I5','arham','scientist','29',104,'future tech','J4','dr siba panda');
insert into invention_manag values(5 , 'facial recognition' , '2021-11-29' , 'DL','ac','I6','manan','professor','31',105,'best tech','J4','david malan');

select * from invention_manag;
                            
create table 1_nf (
							invention_id  int ,
                            invention_name varchar(255),
                            year_invention date , 
                            invention_category varchar(255),
                            story varchar(255),
                            inventor_id varchar(100),
                            inventor_name varchar(100),
                            job_type varchar(50),
                            age varchar(10),
                            award_id int,
                            award_name varchar(255),
                            jury_id varchar(10),
                            jury_name varchar(100),
                            primary key(invention_id , inventor_id)
                            );
insert into 1_nf values(1 , 'autonomous cars' , '2017-03-16' , 'automated system','abc','I1','ahnaan','student','17',101,'best tech','J1','dr suresh patel');
insert into 1_nf values(2 , 'automatic web design' , '2016-07-03' , 'automated system','def','I3','vijay S','student','16',102,'best tool for development','J2','dr kritika singh');
insert into 1_nf values(3 , 'text processing' , '2019-08-26' , 'AI','dd','I4','anshul','student','20',103,'best potention student','J3','mike rooney');
insert into 1_nf values(4 , 'sales prediction' , '2020-03-06' , 'ML','aeec','I5','arham','scientist','29',104,'future tech','J4','dr siba panda');
insert into 1_nf values(5 , 'facial recognition' , '2021-11-29' , 'DL','ac','I6','manan','professor','31',105,'best tech','J4','david malan');
insert into 1_nf values(1 , 'autonomous cars' , '2017-03-16' , 'automated system','abc','I2','nishant','student','17',101,'best tech','J1','dr suresh patel');

select*from 1_nf;

# 2nd normal form

create table invention(
					invention_id int,
                    invention_name varchar(200),
                    invention_category varchar(200),
                    story varchar(10),
                    year_invention date,
                    primary key(invention_id)
                    );
                    
create table inventor(
					inventor_id int,
                    inventor_name varchar(255),
                    age int,
                    job_type varchar(255),
                    city varchar(255),
                    primary key(inventor_id)
                    );
                    
create table award(
				award_id int,
                award_name varchar(255),
                jury_id varchar(10),
                jury_name varchar(100),
                primary key(award_id , jury_id)
                );
                
create table nomination(
					invention_id int,
                    award_id int , 
                    nomination_year int ,
                    foreign key(invention_id) references invention(invention_id) on delete cascade,
                    foreign key(award_id) references award(award_id) on delete cascade
                    );
                    
insert into invention values(1 , 'autonomous cars'  , 'automated system','abc','2017-03-16');
insert into invention values(2 , 'automatic web design'  , 'automated system','def','2016-07-03');
insert into invention values(3 , 'text processing'  , 'AI','dd','2019-08-26');
insert into invention values(4 , 'sales prediction'  , 'ML','aeecc','2020-03-06');
insert into invention values(5 , 'facial recognition'  , 'DL','ac','2021-11-29');

alter table inventor
modify column inventor_id varchar(10);

insert into inventor values('I1' , 'ahnaan' , 17 , 'student' , 'mumbai');
insert into inventor values('I2' , 'nishant' , 17 , 'student' , 'mumbai');
insert into inventor values('I3' , 'vijay s' , 16 , 'student' , 'mumbai');
insert into inventor values('I4' , 'anshul' , 20 , 'student' , 'rajkot');
insert into inventor values('I5' , 'arham' , 29, 'scientist' , 'jammu');
insert into inventor values('I6' , 'manan' , 31 , 'professor' , 'mumbai');

insert into award values(101,'best tech','J1','dr suresh patel');
insert into award values(102,'best tool for development','J2','dr kritika singh');
insert into award values(103,'best potention student','J3','mike rooney');
insert into award values(104,'future tech','J4','dr siba panda');
insert into award values(105,'best tech','J4','david malan');

insert into nomination values(1 , 101 , 2013);
insert into nomination values(2 , 102 , 20119);
insert into nomination values(3 , 103 , 2020);
insert into nomination values(4 , 104 , 2020);
insert into nomination values(5 , 105 , 2020);

select * from invention;
select * from inventor;
select * from award;
select * from nomination;

create table jury(
				jury_id varchar(10),
                jury_name varchar(100),
                primary key (jury_id)
                );
                
insert into jury values('J1','dr suresh patel');
insert into jury values('J2','dr kritika singh');
insert into jury values('J3','mike rooney');
insert into jury values('J4','dr siba panda');
insert into jury values('J5','david malan');

select * from jury;

create table bcnf(
				award_id int,
                jury_id varchar(10),
                foreign key(award_id) references award(award_id) on delete cascade,
                foreign key(jury_id) references jury(jury_id) on delete cascade
                );
insert into bcnf values(101 , 'J1');
insert into bcnf values(102 , 'J2');
insert into bcnf values(103 , 'J3');
insert into bcnf values(104 , 'J4');
insert into bcnf values(105 , 'J5');

select* from bcnf;

create table invention_managmentt(
								invention_id int,
                                inventor_id varchar(10),
                                award_id int , 
                                primary key(invention_id , inventor_id , award_id),
                                foreign key(inventor_id) references inventor(inventor_id) on delete cascade,
                                foreign key(award_id) references award(award_id) on delete cascade
                                );
insert into invention_managmentt values(1 , 'I1' , 101);
insert into invention_managmentt values(1 , 'I2' , 101);
insert into invention_managmentt values(2 , 'I3' , 102);
insert into invention_managmentt values(3 , 'I4' , 103);
insert into invention_managmentt values(4 , 'I5' , 104);
insert into invention_managmentt values(5 , 'I6' , 105);

select * from invention_managmentt;

 create view tempp as select inventor.inventor_name , invention_managmentt.invention_id from inventor  inner join invention_managmentt on inventor.inventor_id = invention_managmentt.inventor_id;
select tempp.inventor_name , invention.invention_name from tempp inner join invention on tempp.invention_id=invention.invention_id;
select invention_id from invention where invention.invention_id in (select nomination.invention_id from nomination);

select concat_ws(', ' , inventor_name , city) as text from inventor;

create view temp2 as select inventor.inventor_name , inventor.inventor_id from inventor where inventor.job_type = 'student';
create view temp3 as select temp2.inventor_name , temp2.inventor_id , invention_managmentt.invention_id from temp2 inner join invention_managmentt on temp2.inventor_id=invention_managmentt.inventor_id;
select temp3.inventor_name , temp3.invention_id , invention.invention_name from temp3 inner join invention on invention.invention_id = temp3.invention_id;