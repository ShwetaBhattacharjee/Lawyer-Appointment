SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ENTER CLIENT ID: '
ACCEPT Y CHAR PROMPT 'ENTER NAME: '


CREATE OR REPLACE PROCEDURE ClientInformation(A in Client.C_id%TYPE, B in Client.Cname%TYPE)
IS
flag int;
BEGIN
	flag:= searchingAccount(A,B);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Account already exists!');
	ELSIF flag=0 THEN
		insert into Client@site1 values(A,B);
		DBMS_OUTPUT.PUT_LINE('Client info inserted.');
	END IF;
END ClientInformation;
/
show errors;

CREATE OR REPLACE FUNCTION searchingAccount(A in Client.C_id%TYPE, B in Client.Cname%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from Client@site1 where C_id=A and Cname=B  ) loop
		foundId:=1;
	end loop;


	return foundId;
END searchingAccount;
/
show errors;


DECLARE
	id number;
	name varchar2(20);
	
BEGIN
	id:= &X;
	name:= '&Y';
	
	
	ClientInformation(id,name);
	

END;
/
commit;



create or replace view view_Client as
select * from Client@site1;

select * from view_Client;
commit;




