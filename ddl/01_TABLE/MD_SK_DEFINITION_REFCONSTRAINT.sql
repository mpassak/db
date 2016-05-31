--------------------------------------------------------
--  Ref Constraints for Table MD_SK_DEFINITION
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_SK_DEFINITION" ADD CONSTRAINT "FK_MD_SK_DE_REFERENCE_MD_EXTRA" FOREIGN KEY ("ID_EXTRACT")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT" ("ID_EXTRACT") ENABLE;
