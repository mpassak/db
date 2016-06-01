--------------------------------------------------------
--  Constraints for Table MD_ST_DEFINITION
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_ST_DEFINITION" ADD CONSTRAINT "PK_MD_ST_DEFINITION" PRIMARY KEY ("ID_ST_DEFINITION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."MD_ST_DEFINITION" MODIFY ("PROPERTY_DEFINITION" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."MD_ST_DEFINITION" MODIFY ("CD_PROPERTY" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."MD_ST_DEFINITION" MODIFY ("ID_ST_DEFINITION" NOT NULL ENABLE);