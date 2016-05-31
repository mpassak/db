--------------------------------------------------------
--  Ref Constraints for Table B_BATCH
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."B_BATCH" ADD CONSTRAINT "FK_B_BATCH_B_FILE" FOREIGN KEY ("ID_FILE")
	  REFERENCES "METSM_OWNER"."B_FILE" ("ID_FILE") ENABLE;
  ALTER TABLE "METSM_OWNER"."B_BATCH" ADD CONSTRAINT "FK_B_BATCH_MD_EXTRACT" FOREIGN KEY ("ID_EXTRACT")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT" ("ID_EXTRACT") ENABLE;
