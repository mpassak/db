--------------------------------------------------------
--  DDL for Trigger TRG_BM_STATUS_DT_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_STATUS_DT_UPDATED" BEFORE UPDATE ON BM_STATUS FOR EACH ROW BEGIN  :new.DT_UPDATED := sysdate; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_STATUS_DT_UPDATED" ENABLE;
