SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X NUMBER PROMPT 'ENTER LAWYER ID: '


declare	
	A number := &X;

	G varchar2(30);
	H varchar2(30);
	
	
begin
	for Q in (select Cname from Client where C_id in (select C_id from Appointment where L_id=A)) loop
		G:= Q.Cname;
		DBMS_OUTPUT.PUT_LINE('Cname: '||G);
	end loop;
	
	for W in(select LawyerName from Lawyers where L_id=A) loop
		H:= W.LawyerName;
	    DBMS_OUTPUT.PUT_LINE('LawyerName: '|| H);
	end loop;

	
end;
/
show errors;
