--------------------------------------------------------
--  DDL for Index PK_MD_TABLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_MD_TABLE" ON "METSM_OWNER"."MD_TABLE" ("ID_TABLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
