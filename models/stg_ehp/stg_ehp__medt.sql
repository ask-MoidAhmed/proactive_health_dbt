{{config(materialized = 'view')}}

select
    medt_id as medteam_id,
    team_no as team_size,
    stf_id as staff_id,
    role_cd as role_code,
    role_des as role_desc
from
    {{source('raw_ehp','RAW_EHP__MEDT')}}