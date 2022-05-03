SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ENTER LAWYERS ID: '
ACCEPT Y CHAR PROMPT 'ENTER CLIENT ID: '


CREATE OR REPLACE PROCEDURE AppointmentInformation(A in Appointment.L_id%TYPE, B in Appointment.C_id%TYPE)
IS
flag int;
BEGIN
	flag:= searchingAccount(A,B);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Appointment Exits!');
	
		delete from Appointment@site1 where L_id=A and C_id=B;
		commit;
		DBMS_OUTPUT.PUT_LINE('Appointment Cancelled.');
		ELSIF flag=0 THEN
		DBMS_OUTPUT.PUT_LINE('No Such Appointment');
		
	END IF;
END AppointmentInformation;
/
show errors;

CREATE OR REPLACE FUNCTION searchingAccount(A in Appointment.L_id%TYPE, B in Appointment.C_id%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from Appointment@site1 where L_id=A and C_id=B  ) loop
		foundId:=1;
	end loop;


	return foundId;
END searchingAccount;
/
show errors;


DECLARE
	lid number;
	cid number;
	
BEGIN
	lid:= &X;
	cid:= &Y;
	
	
	AppointmentInformation(lid,cid);
	

END;
/
commit;



create or replace view view_Appointment as
select * from Appointment@site1;

select * from view_Appointment;
commit;




