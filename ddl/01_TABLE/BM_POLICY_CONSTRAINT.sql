--------------------------------------------------------
--  Constraints for Table BM_POLICY
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_POLICY" ADD CONSTRAINT "PK_BM_POLICY" PRIMARY KEY ("ID_POLICY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("DT_START" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("DT_ISSUED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("POLICY_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_PRODUCT_VARIANT" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_PARTY_OWNER" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_PARTY_INSURED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_PROPOSAL" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_STATUS" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_POLICY" MODIFY ("ID_POLICY" NOT NULL ENABLE);
