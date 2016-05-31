--------------------------------------------------------
--  Ref Constraints for Table BM_SPONSOR
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_SPONSOR" ADD CONSTRAINT "FK_BM_SPONS_FK_BANK_A_BM_BANK_" FOREIGN KEY ("ID_BANK_ACCOUNT")
	  REFERENCES "METSM_OWNER"."BM_BANK_ACCOUNT" ("ID_BANK_ACCOUNT") ENABLE;
