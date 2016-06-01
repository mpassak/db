--------------------------------------------------------
--  File created - Streda-júna-01-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure DROP_ALL_STAGE_VIEWS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "METSM_OWNER"."DROP_ALL_STAGE_VIEWS" 
AS
BEGIN
  FOR i IN
  (SELECT view_name
  FROM dba_views
  WHERE owner = 'METSM_OWNER'
  AND (view_name LIKE 'V_ST%' or view_name LIKE 'V_RW%')
  )
  LOOP
    EXECUTE immediate 'drop view ' || i.view_name;
  END LOOP;
END DROP_ALL_STAGE_VIEWS;

/
