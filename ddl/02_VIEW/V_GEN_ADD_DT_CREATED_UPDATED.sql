--------------------------------------------------------
--  DDL for View V_GEN_ADD_DT_CREATED_UPDATED
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_GEN_ADD_DT_CREATED_UPDATED" ("TABLE_NAME", "COLUMN_NAME", "CMD") AS 
  select table_name, column_name, 'alter table metsm_owner.'|| table_name ||' add '|| column_name ||' DATE;' CMD
from(
select dba_tables.table_name, 'DT_CREATED' column_name
from dba_tables dba_tables
where dba_tables.table_name like 'BM%'
union
select dba_tables.table_name, 'DT_UPDATED' column_name
from dba_tables dba_tables
where dba_tables.table_name like 'BM%'
minus
select dba_tables.table_name, dba_tab_columns.column_name
from dba_tables dba_tables
join dba_tab_columns dba_tab_columns
  on dba_tables.table_name = dba_tab_columns.table_name
where dba_tables.table_name like 'BM%'
 and dba_tab_columns.column_name in ('DT_CREATED', 'DT_UPDATED')
 );
