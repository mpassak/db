--------------------------------------------------------
--  Ref Constraints for Table MD_DATA_ERROR_LOG
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_DATA_ERROR_LOG" ADD CONSTRAINT "FK_MD_DATA__REFERENCE_B_BATCH" FOREIGN KEY ("ID_BATCH")
	  REFERENCES "METSM_OWNER"."B_BATCH" ("ID_BATCH") ENABLE;
  ALTER TABLE "METSM_OWNER"."MD_DATA_ERROR_LOG" ADD CONSTRAINT "FK_MD_DATA__REFERENCE_B_RECORD" FOREIGN KEY ("ID_RECORD")
	  REFERENCES "METSM_OWNER"."B_RECORD" ("ID_RECORD") ENABLE;
  ALTER TABLE "METSM_OWNER"."MD_DATA_ERROR_LOG" ADD CONSTRAINT "FK_MD_DATA__REFERENCE_MD_DATA_" FOREIGN KEY ("ID_DATA_CONTROL")
	  REFERENCES "METSM_OWNER"."MD_DATA_CONTROL" ("ID_DATA_CONTROL") ENABLE;
