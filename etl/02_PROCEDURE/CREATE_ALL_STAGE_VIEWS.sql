--------------------------------------------------------
--  File created - Štvrtok-júna-02-2016   
--------------------------------------------------------
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
    ),
    st_definition as (
        select  md_st_definition.id_extract, 
                listagg(PROPERTY_DEFINITION ||' '|| CD_PROPERTY, ', ')
                      WITHIN GROUP (ORDER BY position) st_definition_list,
                listagg(CD_PROPERTY, ', ')
                      WITHIN GROUP (ORDER BY position) st_definition_properties
        from md_st_definition md_st_definition
        group by md_st_definition.id_extract
    )
    select  md_extract.id_extract,
            md_extract.extract_name,
            md_extract.cd_extract,
            md_extract.property_name_list,
            md_extract.property_name_list2,
            md_extract.property_name_list3,
            sk_definition.sk_definition_list,
            sk_definition.nk_list,
            st_definition.st_definition_list,
            st_definition.st_definition_properties
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
    join st_definition st_definition
      on (md_extract.id_extract = st_definition.id_extract)
;

sql_stmt  VARCHAR2(4000) := '';
sql_stmt2  VARCHAR2(4000) := '';
table_name  VARCHAR2(30) := '';
BEGIN
  FOR extract IN extracts
  LOOP
    sql_stmt := 'CREATE OR REPLACE FORCE VIEW METSM_OWNER.V_RW_'|| extract.cd_extract ||' (extract_name, id_record, id_batch, '|| extract.property_name_list3 ||') AS
      select extract_name, id_record, id_batch, '|| extract.property_name_list3 ||'
      from(
          with sub as(
              select  md_extract.extract_name,
                      st_raw_parsed_data.id_record,
                      b_record.id_batch,
                      md_extract_property.property_name,
                      st_raw_parsed_data.value
              from st_raw_parsed_data st_raw_parsed_data
              join b_record b_record
                on (st_raw_parsed_data.id_record = b_record.id_record)
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
            
      sql_stmt2 := 'CREATE OR REPLACE FORCE VIEW METSM_OWNER.V_ST_'|| extract.cd_extract ||' (extract_name, id_record, id_batch, '|| extract.st_definition_properties ||', '|| extract.nk_list ||') AS
      select extract_name, id_record, id_batch, '|| extract.st_definition_list ||', '|| extract.sk_definition_list ||'
      from METSM_OWNER.V_RW_'|| extract.cd_extract;
      
      dbms_output.put_line(sql_stmt);
      

      dbms_output.put_line(sql_stmt2);
      
      
      EXECUTE IMMEDIATE(sql_stmt);
      EXECUTE IMMEDIATE(sql_stmt2);

      
      select table_name
      into table_name
      from user_TABLES
      where table_name = 'ST_'|| extract.cd_extract;
      
      if(table_name is not null)
        then     EXECUTE IMMEDIATE 'DROP TABLE ST_'|| extract.cd_extract;
      end if;
      EXECUTE IMMEDIATE 'CREATE GLOBAL TEMPORARY TABLE ST_'|| extract.cd_extract ||' ON COMMIT delete ROWS as select * from V_ST_'|| extract.cd_extract ||' where 1 = 0';

  END LOOP;
END CREATE_ALL_STAGE_VIEWS;

/
