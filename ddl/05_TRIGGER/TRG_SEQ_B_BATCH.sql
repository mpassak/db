--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_B_BATCH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_B_BATCH" 
BEFORE INSERT ON METSM_OWNER.B_BATCH
FOR EACH ROW
BEGIN
	IF :new.ID_BATCH IS NULL THEN
		SELECT SEQ_B_BATCH.nextval INTO :new.ID_BATCH FROM DUAL;
	END IF;
END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_B_BATCH" ENABLE;
