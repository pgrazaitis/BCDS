
  CREATE TABLE "DEVELOPER"."KNEE_AGGREGATE_CONTENTION" 
   (	"VET_ID" NUMBER(*,0), 
	"CLAIM_ID" NUMBER(*,0), 
	"DOB" NUMBER(4,0), 
	"END_PRODUCT_CODE" VARCHAR2(12 BYTE), 
	"RO_NUMBER" NUMBER(*,0), 
	"CLAIM_DATE" DATE, 
	"MAX_PROFILE_DATE" DATE, 
	"CONTENTION_COUNT" NUMBER(3,0), 
	"KNEE_CONTENTION_COUNT" NUMBER(3,0), 
	"C230" NUMBER(3,0), 
	"C270" NUMBER(3,0), 
	"C3690" NUMBER(3,0), 
	"C3700" NUMBER(3,0), 
	"C3710" NUMBER(3,0), 
	"C8919" NUMBER(3,0), 
	"C3720" NUMBER(3,0), 
	"C3730" NUMBER(3,0), 
	"C3780" NUMBER(3,0), 
	"C3790" NUMBER(3,0), 
	"C3800" NUMBER(3,0), 	
	"TXT_BILATERAL" NUMBER(3,0), 
	"TXT_LEFT" NUMBER(3,0), 
	"TXT_RIGHT" NUMBER(3,0), 
	"TXT_KNEE" NUMBER(3,0), 
	"TXT_LEG" NUMBER(3,0), 
	"TXT_AMPUTATION" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS FOR OLTP NOLOGGING
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "VBMS_TS" ;
 

  CREATE INDEX "DEVELOPER"."IX_KNEE_AGG_CONTENTION_01" ON "DEVELOPER"."KNEE_AGGREGATE_CONTENTION" ("VET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "INDEX_TS" ;
 
