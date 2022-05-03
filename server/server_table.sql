clear screen;
set line 200;


DROP TABLE Lawyers1 CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;



CREATE TABLE Lawyers1
(
	L_id number PRIMARY KEY,
	LawyerName varchar2(30),
	types varchar2(30),
	Office_hour varchar2(30),
	fees number);
	

create table Client(
	C_id number PRIMARY KEY,
	Cname varchar2(20)
);	


create table Appointment(
	L_id number,
	C_id number,
		FOREIGN KEY(L_id) REFERENCES Lawyers1(L_id),
		FOREIGN KEY(C_id) REFERENCES Client(C_id));
	

	


insert into Lawyers1 values(9, 'Mr.Faheemul Huq', 'Estate Planning Lawyer','4 PM-6 PM',2400);
insert into Lawyers1 values(10, 'Junayed Ahmed Adel', 'Bankruptcy Lawyer','12 PM-4 PM',3500);
insert into Lawyers1 values(11, 'Mr Ramzan Ali Sikder', 'Employment Lawyer','3 PM-8 PM',4500);


insert into Client values(200,'Rajib');
insert into Client values(201,'Suma');
insert into Client values(202,'Asad');
insert into Client values(204,'Latifur');
insert into Client values(205,'Rajat');
insert into Client values(206,'Rahima');
insert into Client values(207,'Rahatul');
insert into Client values(208,'Akash');
insert into Client values(209,'Soummya');
insert into Client values(210,'Shreyan');



insert into Appointment values(9,200);
insert into Appointment values(10,201);
insert into Appointment values(11,202);



	
	

commit;


select * from Lawyers1 union
select * from Lawyers@site1;







