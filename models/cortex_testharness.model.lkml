connection: "looker-private-demo"

include: "/views/*.view.lkml"
#include: "/**/*.dashboard"
# include all views in the views/ folder in this project
connection: "cortex"

datagroup: cortex_demo_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cortex_demo_v1_default_datagroup

explore: aggregated_results_testharness {}

explore: aggregated_results_testharness_2 {}
