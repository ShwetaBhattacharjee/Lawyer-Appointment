SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ENTER LAWYERS ID: '
ACCEPT Y NUMBER PROMPT 'ENTER CLIENT ID: '


CREATE OR REPLACE TRIGGER AppointmentPlace
AFTER INSERT
ON Appointment
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('APPOINTMENT IS PLACED');
END;
/
DECLARE
	A number:=&X; 
	B number:=&Y; 
	flag number;
	founded EXCEPTION;
BEGIN
	flag:= C.Verify(A);
	
	IF flag=0 THEN
		C.insertInformation(A,B);
	else
		RAISE founded;
	end if;
	
	EXCEPTION
		when founded THEN	
			DBMS_OUTPUT.PUT_LINE('NO SUCH LAWYER ID founded IN THE DATABASE!');
	
	
END;
/


CREATE OR REPLACE PACKAGE C AS
	FUNCTION Verify(E in Appointment.L_id%TYPE)
	RETURN NUMBER;
	PROCEDURE insertInformation(E in Appointment.L_id%TYPE, F in Appointment.C_id%TYPE);  
	
	
END C;
/


CREATE OR REPLACE PACKAGE BODY C AS
	
	FUNCTION Verify(E in Appointment.L_id%TYPE)
	RETURN NUMBER
	IS
		Flag number:=0;
		BEGIN 
			IF E>11 THEN
				Flag := 1;
			END IF;
			
		RETURN Flag;	
		END Verify;
		

	PROCEDURE insertInformation(E in Appointment.L_id%TYPE, F in Appointment.C_id%TYPE)
	IS

		BEGIN

			insert into Appointment@site1 values(E,F);
			commit;
		END insertInformation;
					
END C;
/ 





select * from Appointment@site1;













