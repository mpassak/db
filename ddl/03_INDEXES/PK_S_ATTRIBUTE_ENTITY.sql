--------------------------------------------------------
--  DDL for Index PK_S_ATTRIBUTE_ENTITY
--------------------------------------------------------

  CREATE UNIQUE INDEX "METSM_OWNER"."PK_S_ATTRIBUTE_ENTITY" ON "METSM_OWNER"."S_ATTRIBUTE" ("ID_ATTRIBUTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "METSM_OWNER_DATA" ;
