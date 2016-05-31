--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PRODUCT_CATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_CATEGORY" 
        BEFORE INSERT ON METSM_OWNER.BM_PRODUCT_CATEGORY
        FOR EACH ROW
        BEGIN
          IF :new.ID_PRODUCT_CATEGORY IS NULL THEN
            SELECT SEQ_BM_PRODUCT_CATEGORY.nextval INTO :new.ID_PRODUCT_CATEGORY FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT_CATEGORY" ENABLE;
