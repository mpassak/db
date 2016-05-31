--------------------------------------------------------
--  DDL for Trigger TRG_BM_COMM_SCHEME_DT_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_COMM_SCHEME_DT_UPDATED" BEFORE UPDATE ON BM_COMMISSION_SCHEME FOR EACH ROW BEGIN  :new.DT_UPDATED := sysdate; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_COMM_SCHEME_DT_UPDATED" ENABLE;
