--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PARTY_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PARTY_TYPE" 
        BEFORE INSERT ON METSM_OWNER.BM_PARTY_TYPE
        FOR EACH ROW
        BEGIN
          IF :new.ID_TYPE IS NULL THEN
            SELECT SEQ_BM_PARTY_TYPE.nextval INTO :new.ID_TYPE FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PARTY_TYPE" ENABLE;
