--------------------------------------------------------
--  DDL for Trigger TRG_BM_COUNTRY_DT_CREATED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "METSM_OWNER"."TRG_BM_COUNTRY_DT_CREATED" BEFORE INSERT ON BM_COUNTRY FOR EACH ROW BEGIN 	IF :new.DT_CREATED IS NULL THEN SELECT sysdate INTO :new.DT_CREATED FROM DUAL; END IF; END;
/
ALTER TRIGGER "METSM_OWNER"."TRG_BM_COUNTRY_DT_CREATED" ENABLE;