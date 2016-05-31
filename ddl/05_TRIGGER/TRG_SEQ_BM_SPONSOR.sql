--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_SPONSOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_SPONSOR" 
        BEFORE INSERT ON METSM_OWNER.BM_SPONSOR
        FOR EACH ROW
        BEGIN
          IF :new.ID_SPONSOR IS NULL THEN
            SELECT SEQ_BM_SPONSOR.nextval INTO :new.ID_SPONSOR FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_SPONSOR" ENABLE;
