--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_AGENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_AGENT" 
        BEFORE INSERT ON METSM_OWNER.BM_AGENT
        FOR EACH ROW
        BEGIN
          IF :new.ID_AGENT IS NULL THEN
            SELECT SEQ_BM_AGENT.nextval INTO :new.ID_AGENT FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_AGENT" ENABLE;
