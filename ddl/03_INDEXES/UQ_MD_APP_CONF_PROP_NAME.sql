--------------------------------------------------------
--  DDL for Index UQ_MD_APP_CONF_PROP_NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."UQ_MD_APP_CONF_PROP_NAME" ON "METSM_OWNER"."MD_APP_CONFIGURATION" ("PROPERTY_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "METSM_OWNER_DATA" ;
