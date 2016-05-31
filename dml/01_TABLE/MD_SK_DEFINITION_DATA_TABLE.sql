REM INSERTING into METSM_OWNER.MD_SK_DEFINITION
SET DEFINE OFF;
Insert into METSM_OWNER.MD_SK_DEFINITION (ID_SK_DEFINITION,ID_EXTRACT,CD_NK,SK_DEFINITION,ID_TABLE) values ('1','1','NK_POLICY','OLGCONOSK','11');
Insert into METSM_OWNER.MD_SK_DEFINITION (ID_SK_DEFINITION,ID_EXTRACT,CD_NK,SK_DEFINITION,ID_TABLE) values ('2','1','NK_ADDRESS','OLGSTREET ||''#''|| OLGCITI ||''#''|| OLGZIP','1');
Insert into METSM_OWNER.MD_SK_DEFINITION (ID_SK_DEFINITION,ID_EXTRACT,CD_NK,SK_DEFINITION,ID_TABLE) values ('3','1','NK_PARTY','case 
      when olgvip = 1
        then  REPLACE(olgpersid,''/'','''') ||''#''|| olgname ||''#''|| olgsurname 
      when olgvip = 2
        then olgpersid
end','8');
Insert into METSM_OWNER.MD_SK_DEFINITION (ID_SK_DEFINITION,ID_EXTRACT,CD_NK,SK_DEFINITION,ID_TABLE) values ('4','1','NK_PHONE_NUMBER','OLGPHONE','10');