--------------------------------------------------------
--  Constraints for Table MD_EXTRACT_AUTH
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_EXTRACT_AUTH" ADD CONSTRAINT "PK_MD_EXTRACT_AUTH" PRIMARY KEY ("ID_EXTRACT_AUTH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."MD_EXTRACT_AUTH" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."MD_EXTRACT_AUTH" MODIFY ("USERNAME" NOT NULL ENABLE);
