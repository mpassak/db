--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PRODUCT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT" 
        BEFORE INSERT ON METSM_OWNER.BM_PRODUCT
        FOR EACH ROW
        BEGIN
          IF :new.ID_PRODUCT IS NULL THEN
            SELECT SEQ_BM_PRODUCT.nextval INTO :new.ID_PRODUCT FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PRODUCT" ENABLE;
