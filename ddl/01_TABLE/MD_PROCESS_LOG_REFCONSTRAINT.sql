--------------------------------------------------------
--  Ref Constraints for Table MD_PROCESS_LOG
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_PROCESS_LOG" ADD CONSTRAINT "FK_MD_PROCE_REFERENCE_B_BATCH" FOREIGN KEY ("ID_BATCH")
	  REFERENCES "METSM_OWNER"."B_BATCH" ("ID_BATCH") ENABLE;
