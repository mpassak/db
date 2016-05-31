--------------------------------------------------------
--  DDL for Index PK_MD_DATA_ERROR_LOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_MD_DATA_ERROR_LOG" ON "METSM_OWNER"."MD_DATA_ERROR_LOG" ("ID_DATA_ERROR_LOG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA" ;
