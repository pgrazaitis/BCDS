
  CREATE TABLE "DEVELOPER"."COMBO_KNEE_CORP_CLAIM" 
   (	"PTCPNT_VET_ID" NUMBER(15,0), 
	"PRFIL_DT" DATE NOT NULL ENABLE, 
	"BNFT_CLAIM_ID" NUMBER(15,0) NOT NULL ENABLE, 
	"END_PRDCT_TYPE_CD" VARCHAR2(12 BYTE), 
	"DATE_OF_CLAIM" DATE NOT NULL ENABLE, 
	"PAYEE_TYPE_CD" VARCHAR2(12 BYTE), 
	"BNFT_CLAIM_TYPE_CD" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
	"CLAIM_LABEL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"STATUS_TYPE_CD" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
	"CLAIM_RO_NUMBER" NUMBER NOT NULL ENABLE, 
	"CLAIM_RO_NAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"CNTNTN_ID" VARCHAR2(40 BYTE), 
	"CNTNTN_CLSFCN_ID" NUMBER(15,0), 
	"CNTNTN_TYPE_CD" VARCHAR2(12 BYTE), 
	"CNTNTN_CLMANT_TXT" VARCHAR2(255 BYTE), 
	"CNTNTN_MED_IND" VARCHAR2(1 BYTE), 
	"CNTNTN_WELL_GRNDED_APLCBL_IND" VARCHAR2(1 BYTE), 
	"CNTNTN_BEGIN_DT" DATE, 
	"CNTNTN_SPECL_ISSUE_ID" VARCHAR2(40 BYTE), 
	"CNTNTN_SPECL_ISSUE_TYPE_CD" VARCHAR2(12 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 COMPRESS FOR OLTP NOLOGGING
  STORAGE(INITIAL 1048576 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "VBMS_TS" ;
 

   COMMENT ON TABLE "DEVELOPER"."COMBO_KNEE_CORP_CLAIM"  IS 'snapshot table for snapshot ADHOC_DMT_RECURR.COMBO_KNEE_CORP_CLAIM';
 

  CREATE INDEX "DEVELOPER"."IX_CKNEE_CORP_CLAIM_01" ON "DEVELOPER"."COMBO_KNEE_CORP_CLAIM" ("PTCPNT_VET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "INDEX_TS" ;
 

  CREATE INDEX "DEVELOPER"."IX_CKNEE_CORP_CLAIM_02" ON "DEVELOPER"."COMBO_KNEE_CORP_CLAIM" ("BNFT_CLAIM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "INDEX_TS" ;
 

  CREATE INDEX "SYS"."IX_CKNEE_CORP_CLAIM_03" ON "DEVELOPER"."COMBO_KNEE_CORP_CLAIM" ("BNFT_CLAIM_TYPE_CD") 
   INDEXTYPE IS "CTXSYS"."CTXCAT" ;
 

  CREATE OR REPLACE TRIGGER "SYS"."DR$IX_CKNEE_CORP_CLAIM_03TC" after insert or update on "DEVELOPER"."COMBO_KNEE_CORP_CLAIM" for each row declare   reindex boolean := FALSE;   updop   boolean := FALSE; begin   ctxsys.drvdml.c_updtab.delete;   ctxsys.drvdml.c_numtab.delete;   ctxsys.drvdml.c_vctab.delete;   ctxsys.drvdml.c_rowid := :new.rowid;   if (inserting or updating('BNFT_CLAIM_TYPE_CD') or       :new."BNFT_CLAIM_TYPE_CD" <> :old."BNFT_CLAIM_TYPE_CD") then     reindex := TRUE;     updop := (not inserting);     ctxsys.drvdml.c_text_vc2 := :new."BNFT_CLAIM_TYPE_CD";   end if;   ctxsys.drvdml.ctxcat_dml('SYS','IX_CKNEE_CORP_CLAIM_03', reindex, updop); end;
/
ALTER TRIGGER "SYS"."DR$IX_CKNEE_CORP_CLAIM_03TC" ENABLE;
BEGIN 
  DBMS_DDL.SET_TRIGGER_FIRING_PROPERTY('"SYS"','"DR$IX_CKNEE_CORP_CLAIM_03TC"',FALSE) ; 
END;
/
 