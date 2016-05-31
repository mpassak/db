--------------------------------------------------------
--  DDL for Procedure CREATE_ALL_STAGE_VIEWS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "METSM_OWNER"."CREATE_ALL_STAGE_VIEWS" AS 
  
CURSOR extracts IS
    with sk_definition as (
        select  md_sk_definition.id_extract, 
                listagg(md_sk_definition.sk_definition ||' '|| md_sk_definition.cd_nk, ', ')
                      WITHIN GROUP (ORDER BY md_sk_definition.cd_nk) sk_definition_list,
                listagg(md_sk_definition.cd_nk, ', ')
                      WITHIN GROUP (ORDER BY md_sk_definition.cd_nk) nk_list
        from md_sk_definition md_sk_definition
        group by md_sk_definition.id_extract
    )
    select  md_extract.id_extract,
            md_extract.extract_name,
            md_extract.cd_extract,
            md_extract.property_name_list,
            md_extract.property_name_list2,
            md_extract.property_name_list3,
            sk_definition.sk_definition_list,
            sk_definition.nk_list          
    from (
        SELECT    md_extract.id_extract,
                  md_extract.extract_name,
                  md_extract.cd_extract,
                  listagg(md_extract_property.property_name, ', ')
                      WITHIN GROUP (ORDER BY md_extract_property.position) property_name_list3,
                  listagg('"'''|| md_extract_property.property_name ||'''" '|| md_extract_property.property_name, ', ')
                      WITHIN GROUP (ORDER BY md_extract_property.position) property_name_list2,
                  listagg(''''|| md_extract_property.property_name ||'''', ', ')
                      WITHIN GROUP (ORDER BY md_extract_property.position) property_name_list
              FROM md_extract md_extract
              JOIN md_extract_property md_extract_property
                ON (md_extract.id_extract   = md_extract_property.id_extract)
              WHERE md_extract.fl_active = 1
              GROUP BY md_extract.extract_name,
                md_extract.cd_extract,
              md_extract.id_extract
    ) md_extract
    join sk_definition sk_definition
      on (md_extract.id_extract = sk_definition.id_extract)
;

sql_stmt  VARCHAR2(4000) := '';
BEGIN
  FOR extract IN extracts
  LOOP
    sql_stmt := 'CREATE OR REPLACE FORCE VIEW METSM_OWNER.V_ST_'|| extract.cd_extract ||'$VIEW_NAME_SUFIX (extract_name, id_record, id_batch, '|| extract.property_name_list3 ||', '|| extract.nk_list ||') AS
      select extract_name, id_record, id_batch, '|| extract.property_name_list3 ||', '|| extract.sk_definition_list ||'
      from(
          with sub as(
              select  md_extract.extract_name,
                      st_raw_parsed_data.id_record,
                      b_record.id_batch,
                      md_extract_property.property_name,
                      st_raw_parsed_data.value
              from st_raw_parsed_data st_raw_parsed_data
              join b_record b_record
                on (/*b_record.fl_loaded = $FL_LOADED
                    and */st_raw_parsed_data.id_record = b_record.id_record)
              join md_extract_property md_extract_property
                on (st_raw_parsed_data.id_extract_property = md_extract_property.id_extract_property)
              join md_extract md_extract 
                on (md_extract.id_extract = md_extract_property.id_extract )
              where md_extract.id_extract = '|| extract.id_extract ||'
              )
              SELECT  extract_name, 
                      id_record, 
                      id_batch,
                      '|| extract.property_name_list2 ||'                                                                           
              FROM sub 
              PIVOT ( max(value)
                FOR property_name
                IN ('|| extract.property_name_list ||' )
                )
            )';
      dbms_output.put_line(sql_stmt);
      EXECUTE IMMEDIATE(replace(replace(sql_stmt,'$VIEW_NAME_SUFIX',''),'$FL_LOADED','0'));
      EXECUTE IMMEDIATE(replace(replace(sql_stmt,'$VIEW_NAME_SUFIX','_LOADED'),'$FL_LOADED','1'));
  END LOOP;
END CREATE_ALL_STAGE_VIEWS;

/
