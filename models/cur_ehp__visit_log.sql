{{ config(materialized='table') }}

with
    visitation_log as (
        select
            vist.visit_refr,
            vist.pat_id,
            vist.med_team_id,
            vist.vist_date as visit_date,
            vist.duration_days,
            vist.visit_stat,
            vist.visit_type
        from
            {{ref('stg_ehp__vist')}} as vist
    ),

    medical_team as (
        select
            medt.medteam_id as med_team_id,
            medt.team_size,
            stff.staff_name,
            medt.role_desc
        from
            {{ref('stg_ehp__medt')}} as medt
        left join
            {{ref('stg_ehp__stff')}} as stff
            on
                stff.staff_id = medt.staff_id
    ),

    final_cte as (
        select
            vlog.visit_refr,
            patn.pat_name as patient_name,
            patn.gender_desc as gender,
            patn.blood_type,
            case
                when datediff('year', patn.birth_date, current_date()) < 0
                    then 'NA'
                else datediff('year', patn.birth_date, current_date())
            end as age,
            patn.contact_no,
            patn.emergency_contact_name,
            patn.emergency_contact_no,
            vlog.visit_date,
            vlog.duration_days,
            vlog.visit_stat,
            vlog.visit_type,
            medt.team_size as med_team_size,
            medt.staff_name,
            medt.role_desc as staff_role
        from
            visitation_log as vlog
        left join
            {{ref('stg_ehp__patn')}} as patn
            on
                patn.pat_id = vlog.pat_id
        left join
            medical_team as medt
            on
                vlog.med_team_id = medt.med_team_id
    )

select
    *
from
    final_cte