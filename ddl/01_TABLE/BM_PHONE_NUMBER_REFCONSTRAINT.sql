--------------------------------------------------------
--  Ref Constraints for Table BM_PHONE_NUMBER
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_PHONE_NUMBER" ADD CONSTRAINT "FK_PHONE_NUMBER_COUNTRY" FOREIGN KEY ("ID_COUNTRY")
	  REFERENCES "METSM_OWNER"."BM_COUNTRY" ("ID_COUNTRY") ENABLE;
