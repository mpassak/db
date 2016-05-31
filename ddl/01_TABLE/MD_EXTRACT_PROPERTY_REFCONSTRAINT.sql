--------------------------------------------------------
--  Ref Constraints for Table MD_EXTRACT_PROPERTY
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."MD_EXTRACT_PROPERTY" ADD CONSTRAINT "FK_MD_EXTRACT_PROP_MD_EXTRACT" FOREIGN KEY ("ID_EXTRACT")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT" ("ID_EXTRACT") ENABLE;
