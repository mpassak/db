REM INSERTING into METSM_OWNER.MD_DATA_CONTROL
SET DEFINE OFF;
Insert into METSM_OWNER.MD_DATA_CONTROL (ID_DATA_CONTROL,ID_EXTRACT,DATA_CONTROL_NAME,DESCRIPTION,CMD,CD_ERROR,ERROR_MSG,FL_ACTIVE) values ('6','1','test','Testovacia kontrola','select *
from $EXTRACT
where id_record = 825','TEST','Testovaci error','1');
Insert into METSM_OWNER.MD_DATA_CONTROL (ID_DATA_CONTROL,ID_EXTRACT,DATA_CONTROL_NAME,DESCRIPTION,CMD,CD_ERROR,ERROR_MSG,FL_ACTIVE) values ('7','1','test2','Testovacia kontrola','select *
from $EXTRACT
where id_record = 825','TEST2','Testovaci error2','1');
Insert into METSM_OWNER.MD_DATA_CONTROL (ID_DATA_CONTROL,ID_EXTRACT,DATA_CONTROL_NAME,DESCRIPTION,CMD,CD_ERROR,ERROR_MSG,FL_ACTIVE) values ('1','1','Policy number filled','Kontrola vyplnenia cisla poistky','select *
from $EXTRACT
where olgconosk is null','1','Chyba cislo PZ','1');
Insert into METSM_OWNER.MD_DATA_CONTROL (ID_DATA_CONTROL,ID_EXTRACT,DATA_CONTROL_NAME,DESCRIPTION,CMD,CD_ERROR,ERROR_MSG,FL_ACTIVE) values ('2','1','Country code filled','Kontrola vyplnenia kodu krajiny','select *
from $EXTRACT
where substr(olgcn, 1 ,3 ) is null','2','Chyba kod krajiny','1');
Insert into METSM_OWNER.MD_DATA_CONTROL (ID_DATA_CONTROL,ID_EXTRACT,DATA_CONTROL_NAME,DESCRIPTION,CMD,CD_ERROR,ERROR_MSG,FL_ACTIVE) values ('3','1','Invoice filled','Kontrola vyplnenia typu fakturacie','select *
from $EXTRACT
where substr(olgcn, 4, 2) is null','3','Chyba typ fakturacie','1');
