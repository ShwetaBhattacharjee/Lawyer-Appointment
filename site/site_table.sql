clear screen;



DROP TABLE Lawyers CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;



CREATE TABLE Lawyers
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
		FOREIGN KEY(L_id) REFERENCES Lawyers(L_id),
		FOREIGN KEY(C_id) REFERENCES Client(C_id));
	
	

insert into Lawyers values(1, 'Ms. Syeda Faiza Hossain', 'Tax Lawyer','4 PM-8 PM',3000);
insert into Lawyers values(2, 'M. Amir-UlIslam', 'Family Lawyer','10 AM-12 PM',2000);
insert into Lawyers values(3, 'Md. Abdur Rashid', 'Contract Lawyer','9 AM-4 PM',2200);
insert into Lawyers values(4, 'Md. Shakhawat H Khan', 'Contract Lawyer','12 PM- 4 PM',3200);
insert into Lawyers values(5, 'Faisal Mahmud', 'Civil Litigation Lawyer','4 PM-6 PM',2500);
insert into Lawyers values(6, 'Towhida Khondker', 'General Practice Lawyer','10 AM -1 PM',3500);
insert into Lawyers values(7, 'Dr. Shahdeen Malik', 'Employment Lawyer','9 AM-1 PM',2100);
insert into Lawyers values(8, 'Al Amin Rahman', 'Workers Compensation Lawyer','10 AM-4 PM',2500);
insert into Lawyers values(9, 'Mr.Faheemul Huq', 'Estate Planning Lawyer','4 PM-6 PM',2400);
insert into Lawyers values(10, 'Junayed Ahmed Adel', 'Bankruptcy Lawyer','12 PM-4 PM',3500);
insert into Lawyers values(11, 'Mr Ramzan Ali Sikder', 'Employment Lawyer','3 PM-8 PM',4500);



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


	
insert into Appointment values(1,200);
insert into Appointment values(1,201);
insert into Appointment values(1,202);
insert into Appointment values(1,209);
insert into Appointment values(1,204);
insert into Appointment values(2,201);
insert into Appointment values(2,202);
insert into Appointment values(3,205);
insert into Appointment values(5,206);
insert into Appointment values(6,207);


	
	

commit;

select * from Lawyers;   
