--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_MODALITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_MODALITY" 
        BEFORE INSERT ON METSM_OWNER.BM_MODALITY
        FOR EACH ROW
        BEGIN
          IF :new.ID_MODALITY IS NULL THEN
            SELECT SEQ_BM_MODALITY.nextval INTO :new.ID_MODALITY FROM DUAL;
          END IF;
        END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_MODALITY" ENABLE;
