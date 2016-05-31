--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_COMMISSION_SCHEME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_COMMISSION_SCHEME" 
        BEFORE INSERT ON METSM_OWNER.BM_COMMISSION_SCHEME
        FOR EACH ROW
        BEGIN
          IF :new.ID_COMMISSION_SCHEME IS NULL THEN
            SELECT SEQ_BM_COMMISSION_SCHEME.nextval INTO :new.ID_COMMISSION_SCHEME FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_COMMISSION_SCHEME" ENABLE;
