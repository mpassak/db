--------------------------------------------------------
--  DDL for Trigger TRG_BM_PRODUCT_TYPE_DT_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_PRODUCT_TYPE_DT_UPDATED" BEFORE UPDATE ON BM_PRODUCT_TYPE FOR EACH ROW BEGIN  :new.DT_UPDATED := sysdate; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_PRODUCT_TYPE_DT_UPDATED" ENABLE;
