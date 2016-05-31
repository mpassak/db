--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_APP_CONFIGURATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_APP_CONFIGURATION" 
        BEFORE INSERT ON METSM_OWNER.MD_APP_CONFIGURATION
        FOR EACH ROW
        BEGIN
          IF :new.ID_APP_CONFIGURATION IS NULL THEN
            SELECT SEQ_MD_APP_CONFIGURATION.nextval INTO :new.ID_APP_CONFIGURATION FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_APP_CONFIGURATION" ENABLE;
