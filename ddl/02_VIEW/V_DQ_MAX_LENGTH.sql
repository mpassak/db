--------------------------------------------------------
--  DDL for View V_DQ_MAX_LENGTH
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_DQ_MAX_LENGTH" ("EXTRACT_NAME", "ID_RECORD", "PROPERTY_NAME", "VALUE", "MAXIMAL_LENGTH", "ERROR_MSG") AS 
  SELECT md_extract.extract_name,
  st_raw_parsed_data.id_record,
  md_extract_property.property_name,
  st_raw_parsed_data.value,
  md_extract_property.length maximal_length,
  'Prekrocena maximalna povolena dlzka retazca v extrakte: '|| md_extract.extract_name 
  ||', zaznam: '|| st_raw_parsed_data.id_record 
  ||', stlpec: '|| md_extract_property.property_name 
  ||', maximalna dlzka: '|| md_extract_property.length
  ||', hodnota: '|| st_raw_parsed_data.value
  error_msg
FROM md_extract_property md_extract_property
JOIN  st_raw_parsed_data st_raw_parsed_data
ON (md_extract_property.id_extract_property = st_raw_parsed_data.id_extract_property)
JOIN md_extract md_extract
ON (md_extract.id_extract         = md_extract_property.id_extract)
WHERE LENGTH(st_raw_parsed_data.value) > md_extract_property.length;
