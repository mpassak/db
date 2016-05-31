--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PRODUCT_VARIANT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_VARIANT" 
        BEFORE INSERT ON METSM_OWNER.BM_PRODUCT_VARIANT
        FOR EACH ROW
        BEGIN
          IF :new.ID_PRODUCT_VARIANT IS NULL THEN
            SELECT SEQ_BM_PRODUCT_VARIANT.nextval INTO :new.ID_PRODUCT_VARIANT FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_VARIANT" ENABLE;
