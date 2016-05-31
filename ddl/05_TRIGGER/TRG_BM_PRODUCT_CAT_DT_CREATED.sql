--------------------------------------------------------
--  DDL for Trigger TRG_BM_PRODUCT_CAT_DT_CREATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_PRODUCT_CAT_DT_CREATED" BEFORE INSERT ON BM_PRODUCT_CATEGORY FOR EACH ROW BEGIN 	IF :new.DT_CREATED IS NULL THEN SELECT sysdate INTO :new.DT_CREATED FROM DUAL; END IF; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_PRODUCT_CAT_DT_CREATED" ENABLE;
