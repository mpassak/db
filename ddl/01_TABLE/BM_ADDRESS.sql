--------------------------------------------------------
--  DDL for Table BM_ADDRESS
--------------------------------------------------------

  CREATE TABLE "METSM_OWNER"."BM_ADDRESS" 
   (	"ID_ADDRESS" NUMBER(*,0), 
	"ID_ADDRESS_TYPE" NUMBER(*,0), 
	"ID_COUNTRY" NUMBER(*,0), 
	"STREET" VARCHAR2(200 CHAR) DEFAULT NULL, 
	"CITY" VARCHAR2(100 CHAR) DEFAULT NULL, 
	"ZIP" VARCHAR2(10 BYTE) DEFAULT NULL, 
	"DT_CREATED" DATE, 
	"DT_UPDATED" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
