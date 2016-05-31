--------------------------------------------------------
--  DDL for Trigger TRG_SEQ_BM_COUNTRY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_SEQ_BM_COUNTRY" 
BEFORE INSERT ON METSM_OWNER.BM_COUNTRY
FOR EACH ROW
BEGIN
	IF :new.ID_COUNTRY IS NULL THEN
		SELECT SEQ_BM_COUNTRY.nextval INTO :new.ID_COUNTRY FROM DUAL;
	END IF;
END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_SEQ_BM_COUNTRY" ENABLE;