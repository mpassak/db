--------------------------------------------------------
--  Constraints for Table BM_GENDER
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_GENDER" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_GENDER" ADD CONSTRAINT "AK_UK_CD_GENDER_GENDER" UNIQUE ("CD_GENDER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_GENDER" ADD CONSTRAINT "PK_GENDER" PRIMARY KEY ("ID_GENDER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_GENDER" MODIFY ("CD_GENDER" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_GENDER" MODIFY ("ID_GENDER" NOT NULL ENABLE);
