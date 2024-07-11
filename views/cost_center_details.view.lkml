view: cost_center_details {
  sql_table_name: `finance-looker-424218.semantic_search_block.cost_center_details` ;;

  dimension: cost_center_code {
    description: "Cost Center Code"
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_description {
    description: "Cost Center Description"
    type: string
    sql: ${TABLE}.cost_center_description ;;
  }
}
