--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_TABLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_TABLE" 
        BEFORE INSERT ON METSM_OWNER.MD_TABLE
        FOR EACH ROW
        BEGIN
          IF :new.ID_TABLE IS NULL THEN
            SELECT SEQ_MD_TABLE.nextval INTO :new.ID_TABLE FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_TABLE" ENABLE;
