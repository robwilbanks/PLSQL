--C:\Users\admin\AppData\Roaming\SQL Developer

  CREATE TABLE "SYSTEM"."VARRAYTEST" 
   (	"CODE1" VARCHAR2(100 BYTE), 
	"CODE2" VARCHAR2(100 BYTE), 
	"LAGGER" NUMBER(10,0), 
	"LEADER" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('A', 'A', 0, 0);
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('B', 'B', 0, 0); 
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('C', 'C', 0, 0);
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('D', 'D', 0, 0);
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('E', 'E', 0, 0);
INSERT INTO SYSTEM.VARRAYTEST
  (CODE1, CODE2, LAGGER, LEADER)
VALUES
  ('F', 'F', 0, 0);
  
  DECLARE 
   type VARRCODE1 IS TABLE OF VARCHAR2(10);
   type VARRCODE2 IS TABLE OF VARCHAR2(10);
   V_CODE1 VARRCODE1;
   V_CODE2 VARRCODE2;
BEGIN 
   V_CODE1 := VARRCODE1('A', 'B', 'C', 'D', 'E', 'F','B'); 
   V_CODE2 := VARRCODE2('A', 'B', 'C', 'D', 'E', 'F','A'); 
   FOR i in 1 .. V_CODE1.COUNT LOOP 
      UPDATE VARRAYTEST SET "LAGGER" = 10, "LEADER" = 10
      WHERE CODE1 = V_CODE1(i) AND CODE2 = V_CODE2(i);
   END LOOP; 
END; 

SELECT * FROM SYSTEM.VARRAYTEST;

--TRUNCATE TABLE SYSTEM.VARRAYTEST;