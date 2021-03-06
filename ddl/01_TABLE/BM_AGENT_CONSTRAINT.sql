--------------------------------------------------------
--  Constraints for Table BM_AGENT
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_AGENT" ADD CONSTRAINT "PK_BM_AGENT" PRIMARY KEY ("ID_AGENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_AGENT" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_AGENT" MODIFY ("AGENT_NAME" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_AGENT" MODIFY ("ID_BANK_ACCOUNT" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_AGENT" MODIFY ("ID_AGENT" NOT NULL ENABLE);
