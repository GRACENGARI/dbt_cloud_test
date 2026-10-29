with source as (

    select * from {{ source('olist_raw', 'order_reviews') }}

),

renamed as (

    select
        review_id,
        order_id,
        review_score,
        review_comment_title as comment_title,
        {{standardize_text('review_comment_message')}} as comment_message,
        {{standardize_text('safe_cast(review_creation_date as timestamp)')}} as review_created_at,
        {{standardize_text('safe_cast(review_answer_timestamp as timestamp)')}} as review_answered_at

    from source

),

deduplicated as (

    select
        *,
        row_number() over (
            partition by review_id
            order by review_answered_at desc
        ) as row_num

    from renamed

)

select
    review_id,
    order_id,
    review_score,
    comment_title,
    comment_message,
    review_created_at,
    review_answered_at

from deduplicated
where row_num = 1