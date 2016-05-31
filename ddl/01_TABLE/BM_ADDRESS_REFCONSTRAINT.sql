--------------------------------------------------------
--  Ref Constraints for Table BM_ADDRESS
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_ADDRESS" ADD CONSTRAINT "FK_ADDRESS_ADDRESS_TYPE" FOREIGN KEY ("ID_ADDRESS_TYPE")
	  REFERENCES "METSM_OWNER"."BM_ADDRESS_TYPE" ("ID_ADDRESS_TYPE") ENABLE;
  ALTER TABLE "METSM_OWNER"."BM_ADDRESS" ADD CONSTRAINT "FK_ADDRESS_COUNTRY" FOREIGN KEY ("ID_COUNTRY")
	  REFERENCES "METSM_OWNER"."BM_COUNTRY" ("ID_COUNTRY") ENABLE;