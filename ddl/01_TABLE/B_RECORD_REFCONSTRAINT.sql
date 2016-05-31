--------------------------------------------------------
--  Ref Constraints for Table B_RECORD
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."B_RECORD" ADD CONSTRAINT "FK_B_RECORD_B_BATCH" FOREIGN KEY ("ID_BATCH")
	  REFERENCES "METSM_OWNER"."B_BATCH" ("ID_BATCH") ENABLE;
