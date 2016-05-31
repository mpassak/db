--------------------------------------------------------
--  DDL for Trigger TRG_BM_AGENT_DT_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_AGENT_DT_UPDATED" BEFORE UPDATE ON BM_AGENT FOR EACH ROW BEGIN  :new.DT_UPDATED := sysdate; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_AGENT_DT_UPDATED" ENABLE;
