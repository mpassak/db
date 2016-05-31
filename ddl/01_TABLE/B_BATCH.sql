--------------------------------------------------------
--  DDL for Table B_BATCH
--------------------------------------------------------

  CREATE TABLE "METSM_OWNER"."B_BATCH" 
   (	"ID_BATCH" NUMBER(*,0), 
	"ID_EXTRACT" NUMBER(*,0), 
	"ID_FILE" NUMBER(*,0), 
	"DT_EXECUTION_START" DATE DEFAULT NULL, 
	"DT_EXECUTION_END" DATE DEFAULT NULL, 
	"ID_EXECUTION" NUMBER(38,0) DEFAULT 0, 
	"CD_STATUS" VARCHAR2(30 CHAR), 
	"STATUS_MSG" VARCHAR2(1000 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;