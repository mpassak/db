--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_MD_SK_DEFINITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_MD_SK_DEFINITION" 
        BEFORE INSERT ON METSM_OWNER.MD_SK_DEFINITION
        FOR EACH ROW
        BEGIN
          IF :new.ID_SK_DEFINITION IS NULL THEN
            SELECT SEQ_MD_SK_DEFINITION.nextval INTO :new.ID_SK_DEFINITION FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_MD_SK_DEFINITION" ENABLE;
