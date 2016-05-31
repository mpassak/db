--------------------------------------------------------
--  DDL for Table ST_RAW_PARSED_DATA
--------------------------------------------------------

  CREATE TABLE "METSM_OWNER"."ST_RAW_PARSED_DATA" 
   (	"ID_EXTRACT_PROPERTY" NUMBER(*,0) DEFAULT NULL, 
	"ID_RECORD" NUMBER(*,0) DEFAULT NULL, 
	"VALUE" VARCHAR2(500 CHAR) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
