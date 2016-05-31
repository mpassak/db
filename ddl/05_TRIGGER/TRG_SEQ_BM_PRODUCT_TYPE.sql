--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PRODUCT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_TYPE" 
        BEFORE INSERT ON METSM_OWNER.BM_PRODUCT_TYPE
        FOR EACH ROW
        BEGIN
          IF :new.ID_PRODUCT_TYPE IS NULL THEN
            SELECT SEQ_BM_PRODUCT_TYPE.nextval INTO :new.ID_PRODUCT_TYPE FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_TYPE" ENABLE;
