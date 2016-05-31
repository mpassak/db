--------------------------------------------------------
--  Ref Constraints for Table ST_RAW_PARSED_DATA
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."ST_RAW_PARSED_DATA" ADD CONSTRAINT "FK_ST_RAW_PARSED_DATA_B_RECORD" FOREIGN KEY ("ID_RECORD")
	  REFERENCES "METSM_OWNER"."B_RECORD" ("ID_RECORD") ENABLE;
  ALTER TABLE "METSM_OWNER"."ST_RAW_PARSED_DATA" ADD CONSTRAINT "FK_ST_RAW_PARSED_DATA_MD_EXTRA" FOREIGN KEY ("ID_EXTRACT_PROPERTY")
	  REFERENCES "METSM_OWNER"."MD_EXTRACT_PROPERTY" ("ID_EXTRACT_PROPERTY") ENABLE;
