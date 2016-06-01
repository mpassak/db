--------------------------------------------------------
--  Ref Constraints for Table MD_ST_DEFINITION
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_ST_DEFINITION" ADD CONSTRAINT "FK_MD_ST_DE_REFERENCE_MD_EXTRA" FOREIGN KEY ("ID_EXTRACT")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT" ("ID_EXTRACT") ENABLE;
