project_name: "bqml_semantic_search_block"

# This is the ID of the BQML MODEL setup with the remote connect
constant: BQML_REMOTE_CONNECTION_MODEL_ID {
  value: "finance-looker-424218.semantic_search_block.semantic_search_llm"
}

# This is the ID of the remote connection setup in BigQuery
constant: BQML_REMOTE_CONNECTION_ID {
  value: "finance-looker-424218.us.semantic_search_block_vertex_ai"
}

# This is the name of the Looker BigQuery Database connection
constant: LOOKER_BIGQUERY_CONNECTION_NAME {
  value: "semantic_search_block"
}

constant: BQML_EMBEDDINGS_MODEL_ID {
  value: "finance-looker-424218.semantic_search_block.embeddings_model"
}
