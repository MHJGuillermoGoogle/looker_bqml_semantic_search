view: gl_account_details {
  sql_table_name: `finance-looker-424218.semantic_search_block.gl_account_details` ;;

  dimension: gl_account_code {
    description: "GL Account Code"
    type: string
    sql: ${TABLE}.gl_account_code ;;
  }

  dimension: gl_account_description {
    description: "GL Account Description"
    type: string
    sql: ${TABLE}.gl_account_description ;;
  }
}
