connection: "@{LOOKER_BIGQUERY_CONNECTION_NAME}"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.

datagroup: ecomm_daily {
  sql_trigger: SELECT MAX(DATE(created_time)) FROM `bigquery-public-data.thelook_ecommerce.order_items` ;;
  max_cache_age: "32 hours"
}

datagroup: ecomm_monthly {
  sql_trigger: SELECT MAX(MONTH(created_time)) FROM `bigquery-public-data.thelook_ecommerce.order_items` ;;
  max_cache_age: "32 hours"
}

### EXPLORE FOR MATCHED PRODUCTS ONLY ###
explore: product_semantic_search {
  join: order_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items.product_id} = ${product_semantic_search.matched_product_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: order_items_customer {
    from: order_items
    relationship: many_to_one
    sql: RIGHT JOIN ${order_items.SQL_TABLE_NAME} AS order_items_customer ON ${order_items_customer.id} = ${order_items.id} AND ${order_items.user_id} =  ${order_items_customer.user_id};;
  }
}

### EXPLORE FOR MATCHED GL ACCOUNT ONLY ###
explore: gl_account_semantic_search {
  join: gl_account_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${gl_account_details.gl_account_code} = ${gl_account_semantic_search.matched_gl_account_code};;
  }
}

### EXPLORE FOR MATCHED COST CENTER ONLY ###
explore: cost_center_semantic_search {
  join: cost_center_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${cost_center_details.cost_center_code} = ${cost_center_semantic_search.matched_cost_center_code};;
  }
}

### EXPLORE FOR MATCHED PROFIT CENTER ONLY ###
explore: profit_center_semantic_search {
  join: profit_center_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${profit_center_details.profit_center_code} = ${profit_center_semantic_search.matched_profit_center_code};;
  }
}

### END ###

### EXPLORE FOR MATCHED PRODUCTS AND ANY OTHER PRODUCTS ###
explore: order_items {
  join: product_semantic_search {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${product_semantic_search.matched_product_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
}

### END ###
