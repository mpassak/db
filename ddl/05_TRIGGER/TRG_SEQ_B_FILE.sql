--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_B_FILE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_B_FILE" 
BEFORE INSERT ON METSM_OWNER.B_FILE
FOR EACH ROW
BEGIN
	IF :new.ID_FILE IS NULL THEN
		SELECT SEQ_B_FILE.nextval INTO :new.ID_FILE FROM DUAL;
	END IF;
END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_B_FILE" ENABLE;
