--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_DATA_CONTROL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_DATA_CONTROL" 
        BEFORE INSERT ON METSM_OWNER.MD_DATA_CONTROL
        FOR EACH ROW
        BEGIN
          IF :new.ID_DATA_CONTROL IS NULL THEN
            SELECT SEQ_MD_DATA_CONTROL.nextval INTO :new.ID_DATA_CONTROL FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_DATA_CONTROL" ENABLE;
