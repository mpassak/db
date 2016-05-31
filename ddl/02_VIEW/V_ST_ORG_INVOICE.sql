--------------------------------------------------------
--  DDL for View V_ST_ORG_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_ST_ORG_INVOICE" ("EXTRACT_NAME", "ID_RECORD", "ID_BATCH", "CONTRACT", "NAME", "SURNAME", "CN", "DUEDATE", "PAYMENT", "DATEPAYMENT", "SIGNDATE", "CLOSEDATE", "INSDATE", "PPLNENIE", "PUDALOST", "PLNENIE_ID", "AVGINVOICE", "PRODUCT", "CAMPAIGN", "BIRTHDAY") AS 
  select "EXTRACT_NAME","ID_RECORD","ID_BATCH","CONTRACT","NAME","SURNAME","CN","DUEDATE","PAYMENT","DATEPAYMENT","SIGNDATE","CLOSEDATE","INSDATE","PPLNENIE","PUDALOST","PLNENIE_ID","AVGINVOICE","PRODUCT","CAMPAIGN","BIRTHDAY"
      from(
          with sub as(
              select  md_extract.extract_name,
                      st_raw_parsed_data.id_record,
                      b_record.id_batch,
                      md_extract_property.property_name,
                      st_raw_parsed_data.value
              from st_raw_parsed_data st_raw_parsed_data
              join b_record b_record
                on (b_record.fl_loaded = 0
                    and st_raw_parsed_data.id_record = b_record.id_record)
              join md_extract_property md_extract_property
                on (st_raw_parsed_data.id_extract_property = md_extract_property.id_extract_property)
              join md_extract md_extract 
                on (md_extract.id_extract = md_extract_property.id_extract )
              where md_extract.id_extract = 14
              )
              SELECT  extract_name, 
                      id_record, 
                      id_batch,
                      "'Contract'" Contract, "'Name'" Name, "'Surname'" Surname, "'CN'" CN, "'DueDate'" DueDate, "'Payment'" Payment, "'DatePayment'" DatePayment, "'SignDate'" SignDate, "'CloseDate'" CloseDate, "'InsDate'" InsDate, "'Pplnenie'" Pplnenie, "'Pudalost'" Pudalost, "'Plnenie_id'" Plnenie_id, "'AvgInvoice'" AvgInvoice, "'Product'" Product, "'Campaign'" Campaign, "'Birthday'" Birthday                                                                           
              FROM sub 
              PIVOT ( max(value)
                FOR property_name
                IN ('Contract', 'Name', 'Surname', 'CN', 'DueDate', 'Payment', 'DatePayment', 'SignDate', 'CloseDate', 'InsDate', 'Pplnenie', 'Pudalost', 'Plnenie_id', 'AvgInvoice', 'Product', 'Campaign', 'Birthday' )
                )
            );
