--------------------------------------------------------
--  DDL for Index PK_BM_COUNTRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_BM_COUNTRY" ON "METSM_OWNER"."BM_COUNTRY" ("ID_COUNTRY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
