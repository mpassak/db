--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_DATA_ERROR_LOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_DATA_ERROR_LOG" 
        BEFORE INSERT ON METSM_OWNER.MD_DATA_ERROR_LOG
        FOR EACH ROW
        BEGIN
          IF :new.ID_DATA_ERROR_LOG IS NULL THEN
            SELECT SEQ_MD_DATA_ERROR_LOG.nextval INTO :new.ID_DATA_ERROR_LOG FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_DATA_ERROR_LOG" ENABLE;
