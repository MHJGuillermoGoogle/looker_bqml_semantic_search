view: profit_center_details {
  sql_table_name: `finance-looker-424218.semantic_search_block.profit_center_details` ;;

  dimension: profit_center_code {
    description: "Profit Center Code"
    type: string
    sql: ${TABLE}.profit_center_key ;;
  }

  dimension: profit_center_description {
    description: "Profit Center Description"
    type: string
    sql: ${TABLE}.profit_center_description ;;
  }
}
