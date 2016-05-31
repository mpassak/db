--------------------------------------------------------
--  Ref Constraints for Table BM_AGENT
--------------------------------------------------------

  ALTER TABLE "METSM_OWNER"."BM_AGENT" ADD CONSTRAINT "FK_BM_AGENT_REFERENCE_BM_BANK_" FOREIGN KEY ("ID_BANK_ACCOUNT")
	  REFERENCES "METSM_OWNER"."BM_BANK_ACCOUNT" ("ID_BANK_ACCOUNT") ENABLE;
