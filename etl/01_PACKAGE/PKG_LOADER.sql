--------------------------------------------------------
--  File created - Utorok-mája-31-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_LOADER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "METSM_OWNER"."PKG_LOADER" AS 

  PROCEDURE load_batch(p_id_batch integer, p_id_process integer);
  
  PROCEDURE update_batch_status(p_id_batch integer, p_status varchar2);
  
  PROCEDURE create_SK(p_id_batch integer, p_id_process integer);
  
  PROCEDURE insert_process_log(p_id_process integer, p_id_batch integer, p_process_name varchar2, p_action varchar2, p_status varchar2, p_error_msg varchar2, p_id_process_log OUT integer);
  PROCEDURE update_process_log(p_id_process_log integer, p_status varchar2, p_end date, p_error_msg varchar2);
  
  PROCEDURE data_control(p_id_batch integer, p_id_process integer);


END PKG_LOADER;

/
