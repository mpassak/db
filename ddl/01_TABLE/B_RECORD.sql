--------------------------------------------------------
--  DDL for Table B_RECORD
--------------------------------------------------------

  CREATE TABLE "METSM_OWNER"."B_RECORD" 
   (	"ID_RECORD" NUMBER(*,0), 
	"ID_BATCH" NUMBER(*,0), 
	"RECORD_LOCATION" VARCHAR2(200 CHAR), 
	"FL_VALID" NUMBER(*,0) DEFAULT 1, 
	"RAW_DATA" CLOB, 
	"ERROR_MSG" VARCHAR2(500 BYTE), 
	"FL_LOADED" NUMBER(*,0) DEFAULT 0, 
	"ID_POLICY" NUMBER(*,0), 
	"FL_ERROR" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" 
 LOB ("RAW_DATA") STORE AS BASICFILE (
  TABLESPACE "METSM_OWNER_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
