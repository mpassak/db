--------------------------------------------------------
--  DDL for View V_ST_ORG_TRAVEL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_ST_ORG_TRAVEL" ("EXTRACT_NAME", "ID_RECORD", "ID_BATCH", "POLICY_NUMBER", "CD_COUNTRY", "PAYMENT_TYPE", "ACTION_TYPE", "PHONE_NUMBER", "CD_EXTRACT_CODE", "TITLE", "FIRST_NAME", "LAST_NAME", "BIRTH_NUMBER", "COMPANY_NAME", "ICO", "DT_BIRTH_DATE", "STREET", "ZIP", "CITY", "DT_ISSUED", "DT_START", "DT_CLOSE", "PREMIUM", "PARTY_TYPE", "FL_FOREIGNER", "NK_ADDRESS", "NK_PARTY", "NK_PHONE_NUMBER", "NK_POLICY") AS 
  select extract_name, id_record, id_batch, OLGCONOSK POLICY_NUMBER, substr(OLGCN, 1, 3) CD_COUNTRY, substr(OLGCN, 4, 2) PAYMENT_TYPE, case OLGACTTYPE 
                when '03' then 'CREATE'
                when '04' then 'UPDATE'
                when '10' then 'DELETE'
else OLGACTTYPE
end ACTION_TYPE, OLGPHONE PHONE_NUMBER, OLGPRODTYP  CD_EXTRACT_CODE, CASE
WHEN OLGVIP = '1' THEN OLGTITLE
ELSE NULL
END TITLE, CASE
WHEN OLGVIP = '1' THEN OLGNAME
ELSE NULL
END FIRST_NAME, CASE
WHEN OLGVIP = '1' THEN OLGSURNAME
ELSE NULL
END LAST_NAME, CASE
WHEN OLGVIP = '1' THEN REPLACE(OLGPERSID,'/','')
ELSE NULL
END BIRTH_NUMBER, CASE
WHEN OLGVIP = '2' THEN OLGNAME
ELSE NULL
END COMPANY_NAME, CASE
WHEN OLGVIP = '2' THEN OLGPERSID
ELSE NULL
END ICO, to_date(OLGBIRTHDT, 'YYYYMMDD') DT_BIRTH_DATE, OLGSTREET STREET, OLGZIP ZIP, OLGCITI CITY, to_date(OLGENROLDT,'YYYYMMDDHH24MISS') DT_ISSUED, to_date(OLGEFFDT,'YYYYMMDDHH24MISS') DT_START, to_date(OLGCLOSEDT,'YYYYMMDD') DT_CLOSE, OLGPREMIUM PREMIUM, OLGVIP  PARTY_TYPE, case when OLGFOREIGN = 'N' then 0
 when OLGFOREIGN = 'Y' then 1
             else null        
        end FL_FOREIGNER, OLGSTREET ||'#'|| OLGCITI ||'#'|| OLGZIP NK_ADDRESS, case 
      when olgvip = 1
        then  REPLACE(olgpersid,'/','') ||'#'|| olgname ||'#'|| olgsurname 
      when olgvip = 2
        then olgpersid
end NK_PARTY, OLGPHONE NK_PHONE_NUMBER, OLGCONOSK NK_POLICY
      from METSM_OWNER.V_RW_ORG_TRAVEL;
