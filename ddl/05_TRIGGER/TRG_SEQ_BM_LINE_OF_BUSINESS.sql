--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_LINE_OF_BUSINESS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_LINE_OF_BUSINESS" 
        BEFORE INSERT ON METSM_OWNER.BM_LINE_OF_BUSINESS
        FOR EACH ROW
        BEGIN
          IF :new.ID_LINE_OF_BUSINESS IS NULL THEN
            SELECT SEQ_BM_LINE_OF_BUSINESS.nextval INTO :new.ID_LINE_OF_BUSINESS FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_LINE_OF_BUSINESS" ENABLE;
