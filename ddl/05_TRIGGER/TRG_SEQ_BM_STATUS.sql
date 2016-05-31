--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_STATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_STATUS" 
        BEFORE INSERT ON METSM_OWNER.BM_STATUS
        FOR EACH ROW
        BEGIN
          IF :new.ID_STATUS IS NULL THEN
            SELECT SEQ_BM_STATUS.nextval INTO :new.ID_STATUS FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_STATUS" ENABLE;
