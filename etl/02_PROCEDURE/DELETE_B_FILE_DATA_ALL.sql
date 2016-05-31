--------------------------------------------------------
--  DDL for Procedure DELETE_B_FILE_DATA_ALL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "METSM_OWNER"."DELETE_B_FILE_DATA_ALL" AS 
BEGIN
    DELETE FROM ST_RAW_PARSED_DATA;
    DELETE FROM B_RECORD;
    DELETE FROM B_BATCH;
    DELETE FROM B_FILE;
END DELETE_B_FILE_DATA_ALL;

/
