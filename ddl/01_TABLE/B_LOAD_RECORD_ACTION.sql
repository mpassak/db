--------------------------------------------------------
--  DDL for Table B_LOAD_RECORD_ACTION
--------------------------------------------------------

  CREATE TABLE "METSM_OWNER"."B_LOAD_RECORD_ACTION" 
   (	"ID_TABLE" NUMBER(*,0), 
	"ID_RECORD" NUMBER(*,0), 
	"ID_BATCH" NUMBER(*,0), 
	"CD_ACTION" VARCHAR2(10 CHAR), 
	"FL_VALID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
