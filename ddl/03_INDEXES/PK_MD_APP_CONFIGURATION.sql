--------------------------------------------------------
--  DDL for Index PK_MD_APP_CONFIGURATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_MD_APP_CONFIGURATION" ON "METSM_OWNER"."MD_APP_CONFIGURATION" ("ID_APP_CONFIGURATION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "METSM_OWNER_DATA" ;
