--------------------------------------------------------
--  DDL for View V_RW_ORG_TRAVEL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_RW_ORG_TRAVEL" ("EXTRACT_NAME", "ID_RECORD", "ID_BATCH", "OLGCONOSK", "OLGCN", "OLGACTTYPE", "OLGPHONE", "OLGPRODTYP", "OLGTITLE", "OLGNAME", "OLGSURNAME", "OLGPERSID", "OLGBIRTHDT", "OLGSTREET", "OLGZIP", "OLGCITI", "OLGENROLDT", "OLGEFFDT", "OLGCLOSEDT", "OLGDUEDTER", "OLGPREMIUM", "OLGVIP", "OLGFOREIGN", "OLGDUMMY") AS 
  select extract_name, id_record, id_batch, OLGCONOSK, OLGCN, OLGACTTYPE, OLGPHONE, OLGPRODTYP, OLGTITLE, OLGNAME, OLGSURNAME, OLGPERSID, OLGBIRTHDT, OLGSTREET, OLGZIP, OLGCITI, OLGENROLDT, OLGEFFDT, OLGCLOSEDT, OLGDUEDTER, OLGPREMIUM, OLGVIP, OLGFOREIGN, OLGDUMMY
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
