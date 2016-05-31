--------------------------------------------------------
--  File created - Utorok-mája-31-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_ORG_TRAVEL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "METSM_OWNER"."PKG_ORG_TRAVEL" AS

cnt number;
id_process_log integer;
id_process_log_load integer;

PROCEDURE load_batch(p_id_batch integer, p_id_process integer) IS
BEGIN

    dbms_output.put_line('Loadujem batch '|| p_id_batch);
    pkg_loader.insert_process_log(p_id_process, p_id_batch, 'LOAD_ORG_TRAVEL', 'LOAD', 'START', null, id_process_log);
    
    pkg_loader.data_control(p_id_batch, p_id_process);
    
    analyze(p_id_batch, p_id_process);
    
    pkg_loader.create_SK(p_id_batch, p_id_process);
    
    
    pkg_loader.insert_process_log(p_id_process, p_id_batch, 'LOAD_ORG_TRAVEL', 'ETL_LOAD', 'START', null, id_process_log_load);
    create_policy(p_id_batch);
    close_policy(p_id_batch);
    update_policy(p_id_batch);
    
    create_party(p_id_batch);
    update_party(p_id_batch);
    
    create_address(p_id_batch);
    update_address(p_id_batch);
    
    create_phone_number(p_id_batch);
    update_phone_number(p_id_batch);
    pkg_loader.update_process_log(id_process_log_load, 'FINISHED', sysdate, null);
 
   -- create_rider(p_id_batch);
    
    error_handler(p_id_batch);
    
    update_b_record(p_id_batch);
    
    
    PKG_LOADER.update_batch_status(p_id_batch, 'FINISHED');
    pkg_loader.update_process_log(id_process_log, 'FINISHED', sysdate, null);
    
END load_batch;

/******************************************************************************/

PROCEDURE analyze(p_id_batch integer, p_id_process integer) IS
id_process_log integer;
BEGIN
    pkg_loader.insert_process_log(p_id_process, p_id_batch, 'LOAD_ORG_TRAVEL', 'DATA ANALYSIS', 'START', null, id_process_log);
    prepare_B_LOAD_RECORD_ACTION(p_id_batch);
    
    analyze_policy(p_id_batch);
    analyze_party(p_id_batch);
    analyze_address(p_id_batch);
    analyze_phone_number(p_id_batch);
    
    pkg_loader.update_process_log(id_process_log, 'FINISHED', sysdate, null);
    commit;
END;

PROCEDURE prepare_B_LOAD_RECORD_ACTION(p_id_batch integer) IS
BEGIN
    delete from B_LOAD_RECORD_ACTION
    where id_batch = p_id_batch;
END;

PROCEDURE analyze_policy(p_id_batch integer) IS
BEGIN
    insert into b_load_record_action
    select
        11 id_table,
        id_record, 
        id_batch, 
        cd_action,
        case
            when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is null     then 1
            when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is not null then 0
            when st_org_travel.cd_action = 'UPDATE' and sk_table.id_surrogate_key is null     then 0
            when st_org_travel.cd_action = 'UPDATE' and sk_table.id_surrogate_key is not null then 1
            when st_org_travel.cd_action = 'DELETE' and sk_table.id_surrogate_key is null     then 0
            when st_org_travel.cd_action = 'DELETE' and sk_table.id_surrogate_key is not null and bm_policy.id_status = 3  then 0
            when st_org_travel.cd_action = 'DELETE' and sk_table.id_surrogate_key is not null and bm_policy.id_status != 3 then 1
            else 0 
        end fl_valid
    from (
        select 
            st_org_travel.nk_policy cd_natural_key, 
            case st_org_travel.olgacttype 
                when '03' then 'CREATE'
                when '04' then 'UPDATE'
                when '10' then 'DELETE'
            end cd_action,
            st_org_travel.id_record,
            st_org_travel.id_batch
        from v_st_org_travel st_org_travel
        where st_org_travel.id_batch = p_id_batch
    )st_org_travel
    left join sk_table sk_table
      on st_org_travel.cd_natural_key = sk_table.cd_natural_key
    left join bm_policy bm_policy
      on bm_policy.id_policy = sk_table.id_surrogate_key;
    
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line('inserted '|| cnt ||' actions for entity policy.');
END;

PROCEDURE analyze_party(p_id_batch integer) IS
BEGIN
    insert into b_load_record_action
    select
        8 id_table,
        id_record, 
        id_batch, 
        case
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is null     then 'CREATE'
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is not null then 'NO ACTION'
        else 'NO ACTION' 
        end cd_action,
        1 fl_valid
    from (
        select
            st_org_travel.nk_party cd_natural_key, 
            case st_org_travel.olgacttype 
                when '03' then 'CREATE'
                when '04' then 'UPDATE'
                when '10' then 'DELETE'
            end cd_action,
            st_org_travel.id_record,
            st_org_travel.id_batch
        from v_st_org_travel st_org_travel
        where st_org_travel.id_batch = p_id_batch
    )st_org_travel
    left join sk_table sk_table
      on st_org_travel.cd_natural_key = sk_table.cd_natural_key;
    
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line('inserted '|| cnt ||' actions for entity party.');
END;

PROCEDURE analyze_address(p_id_batch integer) IS
BEGIN
    insert into b_load_record_action
    select
        1 id_table,
        id_record, 
        id_batch, 
        case
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is null     then 'CREATE'
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is not null then 'NO ACTION'
        else 'NO ACTION' 
        end cd_action,
        1 fl_valid
    from (
        select 
            st_org_travel.nk_address cd_natural_key, 
            case st_org_travel.olgacttype 
                when '03' then 'CREATE'
                when '04' then 'UPDATE'
                when '10' then 'DELETE'
            end cd_action,
            st_org_travel.id_record,
            st_org_travel.id_batch
        from v_st_org_travel st_org_travel
        where st_org_travel.id_batch = p_id_batch
    )st_org_travel
    left join sk_table sk_table
      on st_org_travel.cd_natural_key = sk_table.cd_natural_key;
    
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line('inserted '|| cnt ||' actions for entity address.');
END;

PROCEDURE analyze_phone_number(p_id_batch integer) IS
BEGIN
    insert into b_load_record_action
    select
        10 id_table,
        id_record, 
        id_batch, 
        case
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is null       then 'CREATE'
          when st_org_travel.cd_action = 'CREATE' and sk_table.id_surrogate_key is not null   then 'NO ACTION'
        else 'NO ACTION' 
        end cd_action,
        1 fl_valid
    from (
        select 
            st_org_travel.nk_phone_number cd_natural_key, 
            case st_org_travel.olgacttype 
                when '03' then 'CREATE'
                when '04' then 'UPDATE'
                when '10' then 'DELETE'
            end cd_action,
            st_org_travel.id_record,
            st_org_travel.id_batch
        from v_st_org_travel st_org_travel
        where st_org_travel.id_batch = p_id_batch
    )st_org_travel
    left join sk_table sk_table
      on st_org_travel.cd_natural_key = sk_table.cd_natural_key;
    
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line('inserted '|| cnt ||' actions for entity phone number.');
END;

/******************************************************************************/
  
PROCEDURE create_policy(p_id_batch integer) IS
begin
    dbms_output.put_line('Inserting New POLICY...');
    
    insert into bm_policy (id_policy, id_status, id_proposal, id_party_insured, id_party_owner, id_product_variant, id_address, id_phone_number, policy_number, dt_issued, dt_start, dt_close, dt_created)
    with extract_code as (
        select bm_product_variant.cd_extract_code, bm_product_variant.id_product_variant
        from b_batch b_batch
        join md_extract md_extract
          on (b_batch.id_extract = md_extract.id_extract)
        join bm_product_variant bm_product_variant
          on (bm_product_variant.id_product = md_extract.id_product)
         where b_batch.id_batch = p_id_batch
    )
    select 
        sk_policy.id_surrogate_key id_policy,
        2 id_status,
        -1 id_proposal,
        sk_party.id_surrogate_key id_party_insured,
        sk_party.id_surrogate_key id_party_owner,
        extract_code.id_product_variant id_product_variant,
        sk_address.id_surrogate_key id_address,
        sk_phone_number.id_surrogate_key id_phone_number,
        v_st_org_travel.olgconosk policy_number,
        to_date(v_st_org_travel.OLGENROLDT,'YYYYMMDDHH24MISS') dt_issued,
        to_date(v_st_org_travel.OLGEFFDT,'YYYYMMDDHH24MISS') dt_start,
        to_date(v_st_org_travel.OLGCLOSEDT,'YYYYMMDD') dt_close,
        sysdate dt_created
    from b_load_record_action b_load_record_action
    join v_st_org_travel v_st_org_travel
      on (b_load_record_action.id_record = v_st_org_travel.id_record)
    join sk_table sk_policy
      on sk_policy.id_table = 11 and v_st_org_travel.nk_policy = sk_policy.cd_natural_key
    join sk_table sk_party
      on sk_party.id_table = 8 and v_st_org_travel.nk_party = sk_party.cd_natural_key
    join sk_table sk_address
      on sk_address.id_table = 1 and v_st_org_travel.nk_address = sk_address.cd_natural_key
    join sk_table sk_phone_number
      on sk_phone_number.id_table = 10 and v_st_org_travel.nk_phone_number = sk_phone_number.cd_natural_key
    join extract_code extract_code
      on extract_code.cd_extract_code = v_st_org_travel.OLGPRODTYP
    where b_load_record_action.id_batch = p_id_batch 
      and b_load_record_action.cd_action = 'CREATE'
      and b_load_record_action.fl_valid = 1
      and b_load_record_action.id_table = 11;

    cnt := SQL%ROWCOUNT;
    dbms_output.put_line(cnt ||' new policies inserted.');
END;


PROCEDURE close_policy(p_id_batch integer) IS
BEGIN
    dbms_output.put_line('Closing POLICY...');
     
    merge into bm_policy bm_policy
    using (
        select 
            sk_policy.id_surrogate_key id_policy,
            3 id_status,
            to_date(v_st_org_travel.OLGCLOSEDT,'YYYYMMDD') dt_close
        from b_load_record_action b_load_record_action
        join v_st_org_travel v_st_org_travel
          on (b_load_record_action.id_record = v_st_org_travel.id_record)
        join sk_table sk_policy
          on sk_policy.id_table = 11 and v_st_org_travel.nk_policy = sk_policy.cd_natural_key
        where b_load_record_action.id_batch = p_id_batch 
          and b_load_record_action.cd_action = 'DELETE'
          and b_load_record_action.fl_valid = 1
          and b_load_record_action.id_table = 11
    ) closed_policy
    ON (bm_policy.id_policy = closed_policy.id_policy)
    WHEN MATCHED THEN
    UPDATE SET  bm_policy.id_status = 3,
                bm_policy.dt_close = closed_policy.dt_close
    ;
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line(cnt ||' policies closed.');
END;

PROCEDURE update_policy(p_id_batch integer) IS
BEGIN
  NULL;
END;

/******************************************************************************/

/*PROCEDURE create_rider(p_id_batch integer)IS
BEGIN

    insert into BM_RIDER (id_rider, id_policy, id_product_variant_plan, coverage, premium, dt_created, dt_updated)
    select 
        SEQ_BM_RIDER.nextVal id_rider, 
        bm_policy.id_policy id_policy, 
        bm_product_variant_plan.id_product_variant_plan id_product_variant_plan, 
        bm_product_variant_plan.coverage coverage, 
        bm_product_variant_plan.premium premium,
        sysdate dt_created,
        null dt_updated
    from v_st_org_travel v_st_org_travel
    join sk_table sk_policy
      on sk_policy.id_table = 11 and v_st_org_travel.olgconosk = sk_policy.cd_natural_key
    join bm_policy bm_policy
      on sk_policy.id_surrogate_key = bm_policy.id_policy
    join bm_product_variant bm_product_variant
      on bm_product_variant.id_product_variant = bm_policy.id_product_variant
    join bm_product_variant_plan bm_product_variant_plan
      on bm_product_variant_plan.id_product_variant = bm_product_variant.id_product_variant
    where v_st_org_travel.id_batch = p_id_batch
    and v_st_org_travel.OLGACTTYPE = '03'
    ;
END;*/

/******************************************************************************/
PROCEDURE create_party(p_id_batch integer) IS
BEGIN
  dbms_output.put_line('Inserting PARTY...');
  
  insert into bm_party (id_party, id_party_type, id_gender, first_name, last_name, title, dt_birth_date, birth_number, ICO, fl_foreigner, email, company_name, dt_created)
    select distinct
        sk_party.id_surrogate_key id_party,
        case when v_st_org_travel.olgvip = 1 then 1
             when v_st_org_travel.olgvip = 2 then 2
             else -1
        end id_party_type,
        -1 id_gender,
        case when v_st_org_travel.olgvip = 1 then v_st_org_travel.olgname
             else null        
        end first_name,
        case when v_st_org_travel.olgvip = 1 then v_st_org_travel.olgsurname
             else null        
        end last_name,
        v_st_org_travel.olgtitle title,
        case when v_st_org_travel.olgvip = 1 then to_date(v_st_org_travel.OLGBIRTHDT, 'YYYYMMDD')
             else null        
        end dt_birth_date,
        case when v_st_org_travel.olgvip = 1 then REPLACE(v_st_org_travel.olgpersid,'/','')
             else null        
        end birth_number,
        case when v_st_org_travel.olgvip = 2 then v_st_org_travel.OLGPERSID
             else null        
        end ICO,      
        case when v_st_org_travel.OLGFOREIGN = 'N' then 0
             when v_st_org_travel.OLGFOREIGN = 'Y' then 1
             else null        
        end fl_foreigner,
        null email,
        case when v_st_org_travel.olgvip = 2 then v_st_org_travel.olgname
             else null        
        end company_name,
        sysdate dt_created
    from b_load_record_action b_load_record_action
    join v_st_org_travel v_st_org_travel
      on (b_load_record_action.id_record = v_st_org_travel.id_record)
    join sk_table sk_party
      on sk_party.id_table = 8 and v_st_org_travel.nk_party = sk_party.cd_natural_key
    where b_load_record_action.id_batch = p_id_batch 
      and b_load_record_action.cd_action = 'CREATE'
      and b_load_record_action.fl_valid = 1
      and b_load_record_action.id_table = 8;
      
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line(cnt ||' new parties created.');
END;

PROCEDURE update_party(p_id_batch integer) IS
BEGIN
  NULL;
END;

/******************************************************************************/

PROCEDURE create_address(p_id_batch integer) IS
BEGIN
  dbms_output.put_line('Inserting ADDRESS...');
  
  insert into bm_address (id_address, id_address_type, id_country, street, city, zip, dt_created)
    select distinct 
        sk_address.id_surrogate_key id_address,
        3 id_address_type,
        nvl(bm_country.id_country, -1) id_country,
        v_st_org_travel.OLGSTREET street,
        v_st_org_travel.OLGCITI city,
        v_st_org_travel.OLGZIP zip,
        sysdate dt_created
    from b_load_record_action b_load_record_action
    join v_st_org_travel v_st_org_travel
      on (b_load_record_action.id_record = v_st_org_travel.id_record)
    join sk_table sk_address
      on sk_address.id_table = 1 and v_st_org_travel.nk_address = sk_address.cd_natural_key
    left join bm_country bm_country
      on bm_country.cd_country = substr(v_st_org_travel.olgcn, 1, 3)
    where b_load_record_action.id_batch = p_id_batch 
      and b_load_record_action.cd_action = 'CREATE'
      and b_load_record_action.fl_valid = 1
      and b_load_record_action.id_table = 1;
      
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line(cnt ||' new addresses created.');
END;

PROCEDURE update_address(p_id_batch integer) IS
BEGIN
  NULL;
END;

/******************************************************************************/

PROCEDURE create_phone_number(p_id_batch integer) IS
BEGIN
  dbms_output.put_line('Inserting PHONE NUMBER...');
  
--TODO telefonne cislo ocistit o predvolbu
    insert into bm_phone_number (id_phone_number, id_country, phone_number, dt_created)
    select distinct
        sk_phone_number.id_surrogate_key id_phone_number,
        nvl(bm_country.id_country, -1) id_country,
        v_st_org_travel.olgphone phone_number,
        sysdate dt_created
    from b_load_record_action b_load_record_action
    join v_st_org_travel v_st_org_travel
      on (b_load_record_action.id_record = v_st_org_travel.id_record) 
    join sk_table sk_phone_number
      on sk_phone_number.id_table = 10 and v_st_org_travel.nk_phone_number = sk_phone_number.cd_natural_key
    left join bm_country bm_country
      on bm_country.phone_area_code = substr(v_st_org_travel.olgphone, 1, 4)
    where b_load_record_action.id_batch = p_id_batch 
      and b_load_record_action.cd_action = 'CREATE'
      and b_load_record_action.fl_valid = 1
      and b_load_record_action.id_table = 1;
      
    cnt := SQL%ROWCOUNT;
    dbms_output.put_line(cnt ||' new phone numbers created.');
END;

PROCEDURE update_phone_number(p_id_batch integer) IS
BEGIN
  NULL;
END;

/******************************************************************************/

PROCEDURE error_handler(p_id_batch integer) IS
BEGIN
    dbms_output.put_line('Inserting Error msg...');
    
    merge into b_record b_record
    using (
        select v_st_org_travel.id_record, 
          case olgacttype
               when '04' then 'update'
               when '10' then 'delete'
          end action,
          v_st_org_travel.olgconosk policy_number
        from v_st_org_travel v_st_org_travel
        left join sk_table sk_policy 
          on sk_policy.cd_natural_key = v_st_org_travel.nk_policy
        where olgacttype in ('04', '10')
         and sk_policy.id_surrogate_key is null
         and v_st_org_travel.id_batch = p_id_batch
    ) errors
    ON (b_record.id_record = errors.id_record)
    WHEN MATCHED THEN
     UPDATE SET b_record.error_msg = 'Cannot execute '|| errors.action ||' on policy '|| errors.policy_number ||'. Policy doesn''t exist.',
                fl_error = 1
    ;
END;

PROCEDURE update_b_record(p_id_batch integer) IS
BEGIN
    dbms_output.put_line('Updating B Record...');
    merge into b_record b_record
    using (
        select sk_policy.id_surrogate_key id_policy, v_st_org_travel.id_record
            from sk_table sk_policy
            join v_st_org_travel v_st_org_travel
            on sk_policy.cd_natural_key = v_st_org_travel.nk_policy
            where id_table = 11 
              and v_st_org_travel.id_batch = p_id_batch
    ) loaded_policy
    ON (b_record.id_record = loaded_policy.id_record)
    WHEN MATCHED THEN
     UPDATE SET b_record.fl_loaded = 1,
        b_record.id_policy = loaded_policy.id_policy
    ;
END;

END PKG_ORG_TRAVEL;

/
