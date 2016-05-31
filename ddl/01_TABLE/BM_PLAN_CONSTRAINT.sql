--------------------------------------------------------
--  Constraints for Table BM_PLAN
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_PLAN" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PLAN" ADD CONSTRAINT "PK_BM_PLAN" PRIMARY KEY ("ID_PLAN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_PLAN" MODIFY ("PLAN_NAME" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PLAN" MODIFY ("CD_PLAN" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PLAN" MODIFY ("ID_PLAN" NOT NULL ENABLE);