--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PLAN" 
        BEFORE INSERT ON METSM_OWNER.BM_PLAN
        FOR EACH ROW
        BEGIN
          IF :new.ID_PLAN IS NULL THEN
            SELECT SEQ_BM_PLAN.nextval INTO :new.ID_PLAN FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PLAN" ENABLE;
