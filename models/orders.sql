with orders as (
  select * from {{ ref('stg_orders') }}
)

select "orderID" AS order_id
, o.customer_id 
, "AMOUNT" AS amount
from raw.stripe.payment as p
left join orders as o
on p."orderID" = o.order_id
