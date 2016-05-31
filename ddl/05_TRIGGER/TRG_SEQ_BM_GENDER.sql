--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_GENDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_GENDER" 
        BEFORE INSERT ON METSM_OWNER.BM_GENDER
        FOR EACH ROW
        BEGIN
          IF :new.ID_GENDER IS NULL THEN
            SELECT SEQ_BM_GENDER.nextval INTO :new.ID_GENDER FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_GENDER" ENABLE;
