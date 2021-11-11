connection: "looker-private-demo"

include: "/views/*.view.lkml"
#include: "/**/*.dashboard"
# include all views in the views/ folder in this project
connection: "looker-private-demo"

datagroup: cortex_demo_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cortex_demo_v1_default_datagroup

explore: aggregated_results_dev_v2 {}

explore: aggregated_results_dev_v2_2 {}
