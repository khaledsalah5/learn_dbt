select * from {{ ref('fct_reviews') }} f join {{ref("dim_listings_cleansed")}} d
on f.LISTING_ID = d.LISTING_ID
where review_date < d.created_at 
