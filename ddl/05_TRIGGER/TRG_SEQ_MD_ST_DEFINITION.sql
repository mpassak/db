--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_ST_DEFINITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_ST_DEFINITION" 
        BEFORE INSERT ON METSM_OWNER.MD_ST_DEFINITION
        FOR EACH ROW
        BEGIN
          IF :new.ID_ST_DEFINITION IS NULL THEN
            SELECT SEQ_MD_ST_DEFINITION.nextval INTO :new.ID_ST_DEFINITION FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_ST_DEFINITION" ENABLE;
