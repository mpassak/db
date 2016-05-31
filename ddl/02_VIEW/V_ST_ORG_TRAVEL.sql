--------------------------------------------------------
--  DDL for View V_ST_ORG_TRAVEL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_ST_ORG_TRAVEL" ("EXTRACT_NAME", "ID_RECORD", "ID_BATCH", "OLGCONOSK", "OLGCN", "OLGACTTYPE", "OLGPHONE", "OLGPRODTYP", "OLGTITLE", "OLGNAME", "OLGSURNAME", "OLGPERSID", "OLGBIRTHDT", "OLGSTREET", "OLGZIP", "OLGCITI", "OLGENROLDT", "OLGEFFDT", "OLGCLOSEDT", "OLGDUEDTER", "OLGPREMIUM", "OLGVIP", "OLGFOREIGN", "OLGDUMMY", "NK_ADDRESS", "NK_PARTY", "NK_PHONE_NUMBER", "NK_POLICY") AS 
  select extract_name, id_record, id_batch, OLGCONOSK, OLGCN, OLGACTTYPE, OLGPHONE, OLGPRODTYP, OLGTITLE, OLGNAME, OLGSURNAME, OLGPERSID, OLGBIRTHDT, OLGSTREET, OLGZIP, OLGCITI, OLGENROLDT, OLGEFFDT, OLGCLOSEDT, OLGDUEDTER, OLGPREMIUM, OLGVIP, OLGFOREIGN, OLGDUMMY, OLGSTREET ||'#'|| OLGZIP ||'#'|| OLGCITI NK_ADDRESS, case 
      when olgvip = 1
        then  REPLACE(olgpersid,'/','') ||'#'|| olgname ||'#'|| olgsurname 
      when olgvip = 2
        then olgpersid
end NK_PARTY, OLGPHONE NK_PHONE_NUMBER, OLGCONOSK NK_POLICY
      from(
          with sub as(
              select  md_extract.extract_name,
                      st_raw_parsed_data.id_record,
                      b_record.id_batch,
                      md_extract_property.property_name,
                      st_raw_parsed_data.value
              from st_raw_parsed_data st_raw_parsed_data
              join b_record b_record
                on (/*b_record.fl_loaded = 0
                    and */st_raw_parsed_data.id_record = b_record.id_record)
              join md_extract_property md_extract_property
                on (st_raw_parsed_data.id_extract_property = md_extract_property.id_extract_property)
              join md_extract md_extract 
                on (md_extract.id_extract = md_extract_property.id_extract )
              where md_extract.id_extract = 1
              )
              SELECT  extract_name, 
                      id_record, 
                      id_batch,
                      "'OLGCONOSK'" OLGCONOSK, "'OLGCN'" OLGCN, "'OLGACTTYPE'" OLGACTTYPE, "'OLGPHONE'" OLGPHONE, "'OLGPRODTYP'" OLGPRODTYP, "'OLGTITLE'" OLGTITLE, "'OLGNAME'" OLGNAME, "'OLGSURNAME'" OLGSURNAME, "'OLGPERSID'" OLGPERSID, "'OLGBIRTHDT'" OLGBIRTHDT, "'OLGSTREET'" OLGSTREET, "'OLGZIP'" OLGZIP, "'OLGCITI'" OLGCITI, "'OLGENROLDT'" OLGENROLDT, "'OLGEFFDT'" OLGEFFDT, "'OLGCLOSEDT'" OLGCLOSEDT, "'OLGDUEDTER'" OLGDUEDTER, "'OLGPREMIUM'" OLGPREMIUM, "'OLGVIP'" OLGVIP, "'OLGFOREIGN'" OLGFOREIGN, "'OLGDUMMY'" OLGDUMMY                                                                           
              FROM sub 
              PIVOT ( max(value)
                FOR property_name
                IN ('OLGCONOSK', 'OLGCN', 'OLGACTTYPE', 'OLGPHONE', 'OLGPRODTYP', 'OLGTITLE', 'OLGNAME', 'OLGSURNAME', 'OLGPERSID', 'OLGBIRTHDT', 'OLGSTREET', 'OLGZIP', 'OLGCITI', 'OLGENROLDT', 'OLGEFFDT', 'OLGCLOSEDT', 'OLGDUEDTER', 'OLGPREMIUM', 'OLGVIP', 'OLGFOREIGN', 'OLGDUMMY' )
                )
            );
