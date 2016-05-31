--------------------------------------------------------
--  File created - Utorok-mája-31-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_ORG_TRAVEL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "METSM_OWNER"."PKG_ORG_TRAVEL" AS 

PROCEDURE load_batch(p_id_batch integer, p_id_process integer);

PROCEDURE analyze(p_id_batch integer, p_id_process integer);

PROCEDURE prepare_B_LOAD_RECORD_ACTION(p_id_batch integer);

PROCEDURE analyze_policy(p_id_batch integer);
PROCEDURE analyze_party(p_id_batch integer);
PROCEDURE analyze_address(p_id_batch integer);
PROCEDURE analyze_phone_number(p_id_batch integer);

--PROCEDURE create_SK(p_id_batch integer);

/*PROCEDURE create_SK_policy(p_id_batch integer);
PROCEDURE create_SK_party(p_id_batch integer);
PROCEDURE create_SK_address(p_id_batch integer);
PROCEDURE create_SK_phone_number(p_id_batch integer);*/

PROCEDURE create_policy(p_id_batch integer);
PROCEDURE close_policy(p_id_batch integer);
PROCEDURE update_policy(p_id_batch integer);

PROCEDURE create_party(p_id_batch integer);
PROCEDURE update_party(p_id_batch integer);

PROCEDURE create_address(p_id_batch integer);
PROCEDURE update_address(p_id_batch integer);

PROCEDURE create_phone_number(p_id_batch integer);
PROCEDURE update_phone_number(p_id_batch integer);

--PROCEDURE create_rider(p_id_batch integer);

PROCEDURE update_b_record(p_id_batch integer);

PROCEDURE error_handler(p_id_batch integer);

END PKG_ORG_TRAVEL;

/
