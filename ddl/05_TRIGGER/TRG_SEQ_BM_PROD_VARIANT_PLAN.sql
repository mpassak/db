--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_PROD_VARIANT_PLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PROD_VARIANT_PLAN" 
        BEFORE INSERT ON METSM_OWNER.BM_PRODUCT_VARIANT_PLAN
        FOR EACH ROW
        BEGIN
          IF :new.ID_PRODUCT_VARIANT_PLAN IS NULL THEN
            SELECT SEQ_BM_PRODUCT_VARIANT_PLAN.nextval INTO :new.ID_PRODUCT_VARIANT_PLAN FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_PROD_VARIANT_PLAN" ENABLE;
