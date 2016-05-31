--------------------------------------------------------
--  DDL for View V_GEN_DT_CREATED_UPDATED_TRG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_GEN_DT_CREATED_UPDATED_TRG" ("TABLE_NAME", "COLUMN_NAME", "CMD") AS 
  select dba_tables.table_name, dba_tab_columns.column_name,
case 
when dba_tab_columns.column_name = 'DT_UPDATED' then 
    'CREATE OR REPLACE TRIGGER TRG_'|| dba_tables.table_name ||'_'|| dba_tab_columns.column_name ||' BEFORE UPDATE ON '|| dba_tables.table_name ||' FOR EACH ROW BEGIN  :new.'|| dba_tab_columns.column_name ||' := sysdate; END;'
when dba_tab_columns.column_name = 'DT_CREATED' then
    'CREATE OR REPLACE TRIGGER TRG_'|| dba_tables.table_name ||'_'|| dba_tab_columns.column_name ||' BEFORE INSERT ON '|| dba_tables.table_name ||' FOR EACH ROW BEGIN 	IF :new.DT_CREATED IS NULL THEN SELECT sysdate INTO :new.'|| dba_tab_columns.column_name ||' FROM DUAL; END IF; END;'
END CMD

from dba_tables dba_tables
join dba_tab_columns dba_tab_columns
  on dba_tables.table_name = dba_tab_columns.table_name
left join dba_triggers dba_triggers
  on dba_triggers.trigger_name = 'TRG_'|| dba_tables.table_name ||'_'|| dba_tab_columns.column_name
where dba_tables.table_name like 'BM%'
 and dba_tab_columns.column_name in ('DT_CREATED', 'DT_UPDATED')
 and dba_triggers.trigger_name is null;
