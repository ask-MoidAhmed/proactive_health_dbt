{{config(materialized = 'view')}}

with
    initial_cleaning as (
        select
            pat_id,
            nullif(f_name,'NULL') as f_name,
            nullif(m_name,'NULL') as m_name,
            nullif(l_name,'NULL') as l_name,
            gen_cd::integer as gen_cd,
            gen_des,
            try_to_date(dt_brt,'MM/dd/YYYY') as dt_brt,
            replace(con_no,'-','')::integer as con_no,
            nullif(em_add,'NULL') as em_add,
            nullif(ec_f_name,'NULL') as ec_f_name,
            nullif(ec_m_name,'NULL') as ec_m_name,
            nullif(ec_l_name,'NULL') as ec_l_name,
            replace(ec_con_no,'-','')::integer as ec_con_no,
            b_type,
            mar_st,
            nat_id_s,
            nat_id_t,
            replace(nat_id_n,'-','') as nat_id_n,
            try_to_date(nat_id_e,'MM/dd/YYYY') as nat_id_e,
            try_to_timestamp(ingst_tmstmp,'MM/dd/YYYY hh24:mi') as ingst_tmstmp
        from
             {{ source('raw_ehp','RAW_EHP__PATN')}}
    ),

    final_cleanup as (
        select
            pat_id,
            case    
                when m_name is null
                    then concat_ws(' ', f_name, l_name)
                else concat_ws(' ', f_name, m_name, l_name)
            end as pat_name,
            gen_cd as gender_code,
            gen_des as gender_desc,
            dt_brt as birth_date,
            con_no as contact_no,
            em_add as email_add,
            case
                when ec_m_name is null
                    then concat_ws(' ', ec_f_name, ec_l_name)
                else concat_ws(' ', ec_f_name, ec_m_name, ec_l_name)
            end as emergency_contact_name,
            ec_con_no as emergency_contact_no,
            b_type as blood_type,
            mar_st as marriage_status,
            nat_id_s as id_state,
            nat_id_t as id_type,
            nat_id_n as id_name,
            nat_id_e as id_expiry,
            ingst_tmstmp as ingestion_timestamp
        from
            initial_cleaning
    )

select
    *
from
    final_cleanup