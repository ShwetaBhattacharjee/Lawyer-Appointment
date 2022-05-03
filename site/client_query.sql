
SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X NUMBER PROMPT 'ENTER CLIENT ID: '


declare	
	A number := &X;

	G varchar2(30);
	H varchar2(30);
	
	
begin
	for Q in (Select LawyerName from Lawyers where L_id in (Select L_id from Appointment where C_id=a)) loop
		G:= Q.LawyerName;
		DBMS_OUTPUT.PUT_LINE('LawyerName: '||G);
	end loop;
	
	for W in(Select Cname from Client where C_id=a) loop
		H:= W.Cname;
	    DBMS_OUTPUT.PUT_LINE('Cname: '|| H);
	end loop;
	
	
end;
/
show errors;
