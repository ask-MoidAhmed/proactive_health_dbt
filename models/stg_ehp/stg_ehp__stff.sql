{{config(materialized = 'view')}}

-- select * 
-- from {{source('raw_ehp','RAW_EHP__STFF')}}

with
    final_cleaning as (
        select
            stf_id as staff_id,
            case
                when m_name is null
                    then concat_ws('',f_name,l_name)
                else concat_ws(' ',f_name,m_name,l_name)
            end as staff_name,
            gen_cd as gender_code,
            gen_des as gender_desc,
            try_to_date(dt_brt,'MM/dd/YYYY') as birth_date,
            dep_id as department_id
        from
            {{source('raw_ehp','RAW_EHP__STFF')}}
    )

select *
from final_cleaning