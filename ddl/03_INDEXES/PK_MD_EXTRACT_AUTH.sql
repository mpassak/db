--------------------------------------------------------
--  DDL for Index PK_MD_EXTRACT_AUTH
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_MD_EXTRACT_AUTH" ON "METSM_OWNER"."MD_EXTRACT_AUTH" ("ID_EXTRACT_AUTH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "METSM_OWNER_DATA" ;
