--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_PROCESS_LOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_PROCESS_LOG" 
        BEFORE INSERT ON METSM_OWNER.MD_PROCESS_LOG
        FOR EACH ROW
        BEGIN
          IF :new.ID_PROCESS_LOG IS NULL THEN
            SELECT SEQ_MD_PROCESS_LOG.nextval INTO :new.ID_PROCESS_LOG FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_PROCESS_LOG" ENABLE;
