--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_B_RECORD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_B_RECORD" 
BEFORE INSERT ON METSM_OWNER.B_RECORD
FOR EACH ROW
BEGIN
	IF :new.ID_RECORD IS NULL THEN
		SELECT SEQ_B_RECORD.nextval INTO :new.ID_RECORD FROM DUAL;
	END IF;
END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_B_RECORD" ENABLE;
