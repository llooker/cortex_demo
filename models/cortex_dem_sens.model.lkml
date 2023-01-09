connection: "cortex-central-demo-project"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard"

#include: "/**/*.dashboard"
# include all views in the views/ folder in this project

datagroup: cortex_demo_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cortex_demo_v1_default_datagroup

explore: aggregated_results_dev_v2 {}

explore: aggregated_results_dev_v2_2 {}


###cortex_dev

explore: aggregated_results_dev {}

explore: aggregated_results_dev_2 {}


###cortex_ref

explore: aggregated_results_ref {}


#cortex_testharness
explore: aggregated_results_testharness {}

explore: aggregated_results_testharness_2 {}