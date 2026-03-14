{{config(materialized = 'view')}}

with
    final_cleanup as (
        select
            refr_no as visit_refr,
            pat_id,
            medt_id as med_team_id,
            to_date(vis_en) as vist_date,
            greatest(to_date(vis_ex) - to_date(vis_en), 0) as duration_days,
            case
                when vstat_des = 'Admitted'
                    then 'Need Follow-Up'
                else vstat_des
            end as visit_stat,
            vtype_des as visit_type,
            rom_id as room_id
        from
            {{source('raw_ehp','RAW_EHP__VIST')}}
    )

select 
    *
from
    final_cleanup