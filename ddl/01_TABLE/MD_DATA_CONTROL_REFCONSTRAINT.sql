--------------------------------------------------------
--  Ref Constraints for Table MD_DATA_CONTROL
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_DATA_CONTROL" ADD CONSTRAINT "FK_MD_DATA__REFERENCE_MD_EXTRA" FOREIGN KEY ("ID_EXTRACT")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT" ("ID_EXTRACT") ENABLE;
