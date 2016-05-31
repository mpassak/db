--------------------------------------------------------
--  DDL for View V_DQ_MANDATORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_DQ_MANDATORY" ("EXTRACT_NAME", "ID_RECORD", "PROPERTY_NAME", "ID_BATCH", "ERROR_MSG") AS 
  SELECT md_extract.extract_name,
  st_raw_parsed_data.id_record,
  md_extract_property.property_name,
  b_record.id_batch,
  'Nie je vyplneny povinny stlpec v extrakte '|| md_extract.extract_name 
  ||', batch: '|| b_record.id_batch
  ||', zaznam: '|| st_raw_parsed_data.id_record 
  ||', stlpec: '|| md_extract_property.property_name 
  error_msg
FROM md_extract_property md_extract_property
JOIN ST_RAW_PARSED_DATA ST_RAW_PARSED_DATA
ON (md_extract_property.id_extract_property = st_raw_parsed_data.id_extract_property)
JOIN md_extract md_extract
ON (md_extract.id_extract         = md_extract_property.id_extract)
join b_record b_record
  on (b_record.id_record = st_raw_parsed_data.id_record)
WHERE (st_raw_parsed_data.value is null or st_raw_parsed_data.value = '')
  and md_extract_property.mandatory = 1;
