--------------------------------------------------------
--  DDL for Trigger TRG_BM_COUNTRY_DT_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_COUNTRY_DT_UPDATED" BEFORE UPDATE ON BM_COUNTRY FOR EACH ROW BEGIN  :new.DT_UPDATED := sysdate; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_COUNTRY_DT_UPDATED" ENABLE;
