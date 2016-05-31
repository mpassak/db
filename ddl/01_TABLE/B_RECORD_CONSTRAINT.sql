--------------------------------------------------------
--  Constraints for Table B_RECORD
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."B_RECORD" MODIFY ("FL_LOADED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."B_RECORD" MODIFY ("FL_VALID" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."B_RECORD" ADD CONSTRAINT "PK_B_RECORD" PRIMARY KEY ("ID_RECORD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."B_RECORD" MODIFY ("RECORD_LOCATION" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."B_RECORD" MODIFY ("ID_BATCH" NOT NULL ENABLE);
