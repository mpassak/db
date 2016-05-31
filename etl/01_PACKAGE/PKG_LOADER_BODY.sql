--------------------------------------------------------
--  File created - Utorok-mája-31-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_LOADER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "METSM_OWNER"."PKG_LOADER" AS

p_cd_extract varchar2(30 char);
p_cd_status varchar2(30 char);

PROCEDURE load_batch(p_id_batch integer, p_id_process integer) IS
BEGIN
--dbms_output.put_line('Extrakt este nema mapovanie');

    select md_extract.cd_extract, b_batch.cd_status INTO p_cd_extract, p_cd_status
          from b_batch b_batch
          join md_extract md_extract
          on b_batch.id_extract = md_extract.id_extract
          where b_batch.id_batch = p_id_batch;
    dbms_output.put_line('Loading: '|| p_cd_extract);
    
    if p_cd_status in ('PARSER_FINISHED', 'RELOAD', 'DATA_LOADING_ERROR')
    then
        CASE p_cd_extract        
           WHEN 'ORG_TRAVEL' THEN pkg_org_travel.load_batch(p_id_batch, p_id_process);
           ELSE dbms_output.put_line('Extrakt '|| p_cd_extract ||' este nema mapovanie');
        END CASE;
    else
        dbms_output.put_line('Cannot load batch if status is: '|| p_cd_status);
    end if;

END load_batch;


PROCEDURE update_batch_status(p_id_batch integer, p_status varchar2) IS
BEGIN
    update b_batch set cd_status = p_status
    where id_batch = p_id_batch;
END;


PROCEDURE create_SK(p_id_batch integer, p_id_process integer) IS
 
    CURSOR sk_definitions IS
          select  md_sk_definition.cd_nk,
                  md_table.table_name,
                  md_table.id_table,
                  md_table.sequence_name
          from b_batch b_batch
          join md_sk_definition md_sk_definition
            on md_sk_definition.id_extract = b_batch.id_extract
          join md_table md_table
            on md_table.id_table = md_sk_definition.id_table
          where id_batch = p_id_batch
    ;

    sql_stmt  VARCHAR2(4000) := '';
    id_process_log integer;
BEGIN
  pkg_loader.insert_process_log(p_id_process, p_id_batch, 'LOAD_ORG_TRAVEL', 'SK_GENERATION', 'START', null, id_process_log);
  
  FOR sk_definition IN sk_definitions
  LOOP
      sql_stmt := 'insert into sk_table (id_table, cd_natural_key, id_surrogate_key)
                  select '|| sk_definition.id_table ||', cd_natural_key, '|| sk_definition.sequence_name ||'.nextVal
                  from(
                      select distinct v_st_org_travel.'|| sk_definition.cd_nk ||' cd_natural_key
                      from b_load_record_action b_load_record_action
                      join v_st_org_travel v_st_org_travel
                        on (b_load_record_action.id_record = v_st_org_travel.id_record)
                      where b_load_record_action.id_batch = '|| p_id_batch ||'
                        and b_load_record_action.cd_action = ''CREATE''
                        and b_load_record_action.fl_valid = 1
                        and b_load_record_action.id_table = '|| sk_definition.id_table ||'
                  )
      ';
      dbms_output.put_line(sql_stmt);
      EXECUTE IMMEDIATE(sql_stmt);
  END LOOP;
  
  pkg_loader.update_process_log(id_process_log, 'FINISHED', sysdate, null);
END;


PROCEDURE insert_process_log(p_id_process integer, p_id_batch integer, p_process_name varchar2, p_action varchar2, p_status varchar2, p_error_msg varchar2, p_id_process_log OUT integer) IS
BEGIN
    select SEQ_MD_PROCESS_LOG.nextVal 
    into p_id_process_log
    from dual;
    
    insert into md_process_log
    values(p_id_process_log, p_id_process, p_id_batch, p_process_name, p_action, p_status, sysdate, null, p_error_msg);
END;

PROCEDURE update_process_log(p_id_process_log integer, p_status varchar2, p_end date, p_error_msg varchar2) IS
BEGIN
    update md_process_log
    set md_process_log.status = p_status, md_process_log.dt_end = p_end, md_process_log.error_msg = p_error_msg
    where md_process_log.id_process_log = p_id_process_log;
END;


PROCEDURE data_control(p_id_batch integer, p_id_process integer) IS
  sql_stmt  VARCHAR2(4000) := '';

  cursor data_controls is
    select  
        b_batch.id_batch, 
        md_extract.id_extract, 
        md_extract.cd_extract,
        md_data_control.id_data_control,
        md_data_control.data_control_name, 
        md_data_control.cd_error, 
        md_data_control.error_msg,
        md_data_control.cmd
    from b_batch b_batch
    join md_extract md_extract
      on b_batch.id_extract = md_extract.id_extract
    join md_data_control md_data_control
      on md_data_control.id_extract = md_extract.id_extract and md_data_control.fl_active = 1
    where b_batch.id_batch = p_id_batch;
    
BEGIN
  FOR data_control IN data_controls
    LOOP
        sql_stmt := 'insert into MD_DATA_ERROR_LOG (id_record, id_batch, id_extract, id_data_control, error_msg, dt_created)
                    select id_record, '|| data_control.id_batch ||' id_batch, '|| data_control.id_extract ||' id_extract, '|| data_control.id_data_control ||' id_data_control, '''|| data_control.error_msg ||''' error_msg, sysdate dt_created 
                    from(
                        '|| data_control.cmd ||'
                    )';
                    
        sql_stmt := replace(sql_stmt, '$EXTRACT', 'V_ST_'|| data_control.cd_extract);
        dbms_output.put_line(sql_stmt);
        EXECUTE IMMEDIATE(sql_stmt);
  END LOOP;
  
  merge into b_record
  using (
      select id_record, listagg(error_msg, ', ') within group (order by error_msg) error_msgs
      from md_data_error_log
      where id_batch = p_id_batch
      group by id_record
  ) errors
  ON (b_record.id_record = errors.id_record)
      WHEN MATCHED THEN
       UPDATE SET b_record.fl_valid = 0,
          b_record.error_msg = errors.error_msgs
    ;

END;


END PKG_LOADER;

/
