--------------------------------------------------------
--  Constraints for Table BM_PARTY
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_PARTY" MODIFY ("DT_CREATED" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PARTY" ADD CONSTRAINT "PK_BM_PARTY" PRIMARY KEY ("ID_PARTY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_PARTY" ADD CONSTRAINT "CKC_FL_FOREIGNER_BM_PARTY" CHECK (FL_FOREIGNER is null or (FL_FOREIGNER in (0,1))) ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_PARTY" MODIFY ("ID_PARTY_TYPE" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PARTY" MODIFY ("ID_PARTY" NOT NULL ENABLE);
