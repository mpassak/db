--------------------------------------------------------
--  DDL for View V_GEN_ID_INSERT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "METSM_OWNER"."V_GEN_ID_INSERT_TRIGGER" ("TRIGGER_NAME", "CMD") AS 
  select  'TRG_'|| dba_sequences.sequence_name trigger_name,
        'create or replace 
        TRIGGER TRG_'|| dba_sequences.sequence_name ||'
        BEFORE INSERT ON METSM_OWNER.'|| DBA_TABLES.table_name ||'
        FOR EACH ROW
        BEGIN
          IF :new.'|| dba_ind_columns.column_name ||' IS NULL THEN
            SELECT '|| dba_sequences.sequence_name ||'.nextval INTO :new.'|| dba_ind_columns.column_name ||' FROM DUAL;
          END IF;
        END;' CMD
from dba_sequences dba_sequences
left join dba_triggers dba_triggers
  on (dba_triggers.owner = 'METSM_OWNER' and dba_triggers.trigger_type = 'BEFORE EACH ROW' and triggering_event = 'INSERT'
      and dba_triggers.trigger_name = 'TRG_'|| dba_sequences.sequence_name)
join dba_tables dba_tables
  on(dba_tables.owner = 'METSM_OWNER' and 'SEQ_'|| dba_tables.table_name = dba_sequences.sequence_name)
join dba_indexes dba_indexes
  on(dba_tables.table_name = dba_indexes.table_name and dba_indexes.owner = 'METSM_OWNER' and dba_indexes.index_name like 'PK%')
join dba_ind_columns dba_ind_columns
  on dba_indexes.index_name = dba_ind_columns.index_name
where dba_sequences.sequence_owner = 'METSM_OWNER'
and dba_triggers.trigger_name is null;
