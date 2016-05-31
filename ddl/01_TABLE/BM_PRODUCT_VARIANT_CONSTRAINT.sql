--------------------------------------------------------
--  Constraints for Table BM_PRODUCT_VARIANT
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ENTRY_AGE_LIMIT_HIGH" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ID_PRODUCT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" ADD CONSTRAINT "AK_UK_CD_PRODUCT_VARI_BM_PRODU" UNIQUE ("CD_PRODUCT_VARIANT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" ADD CONSTRAINT "PK_BM_PRODUCT_VARAINT" PRIMARY KEY ("ID_PRODUCT_VARIANT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 524288 NEXT 524288 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "METSM_OWNER_DATA"  ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ENTRY_AGE_LIMIT_LOW" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("VALID_SINCE" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("PRODUCT_VARIANT_NAME" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ID_MODALITY" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ID_PRODUCT" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("CD_PRODUCT_VARIANT" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("ID_PRODUCT_VARIANT" NOT NULL ENABLE);
  ALTER TABLE "METSM_OWNER"."BM_PRODUCT_VARIANT" MODIFY ("DT_CREATED" NOT NULL ENABLE);
