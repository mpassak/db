--------------------------------------------------------
--  Constraints for Table BM_LINE_OF_BUSINESS
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" ADD CONSTRAINT "AK_UK_CD_LINE_OF_BUSI_BM_LINE_" UNIQUE ("CD_LINE_OF_BUSINESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" ADD CONSTRAINT "PK_BM_LINE_OF_BUSINESS" PRIMARY KEY ("ID_LINE_OF_BUSINESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" MODIFY ("LINE_OF_BUSINESS_NAME" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" MODIFY ("CD_LINE_OF_BUSINESS" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_LINE_OF_BUSINESS" MODIFY ("ID_LINE_OF_BUSINESS" NOT NULL ENABLE);
