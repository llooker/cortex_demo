view: aggregated_results_testharness_2 {
  derived_table: {
    sql:
    WITH
      a AS (
      SELECT
        *,
        EXTRACT(week
        FROM
          CAST(Date AS Date)) week_of_year
      FROM
        `cortex-demo-environment.TestHarness_CortexIntelligence.AggregatedResults` )
    SELECT
      a.*,
      b.average_temperature,
      (CAST(a.TemperatureInFahrenheit AS numeric)-b.average_temperature) delta_temperature,
      AVG(b.average_temperature) OVER(PARTITION BY a.LocationDMA, a.ProductName, a.CustomerName ORDER BY CAST(DATE AS DATE) ROWS BETWEEN 2 PRECEDING
        AND 2 FOLLOWING) moving_average_temperature
    FROM
      a
    LEFT JOIN (
      SELECT
        EXTRACT(week FROM CAST(Date AS Date)) week_of_year,
        LocationDMA,
        AVG(CAST(TemperatureInFahrenheit AS numeric)) average_temperature
      FROM
        `cortex-demo-environment.TestHarness_CortexIntelligence.AggregatedResults`
      WHERE
        LocationDMA='Boston (Manchester)'
      GROUP BY
        week_of_year,
        LocationDMA) b
    ON
      a.week_of_year=b.week_of_year;;
  }

  dimension: catalog_item_id {
    type: string
    sql: ${TABLE}.CatalogItemID ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Date ;;
  }

  dimension: demand_plan {
    type: number
    sql: ${TABLE}.demandPlan ;;
  }

  dimension: differential_alert {
    type: string
    sql: ${TABLE}.DifferentialAlert ;;
  }

  dimension: expected_differential_impact {
    type: number
    sql: CAST(${TABLE}.ExpectedDifferentialImpact as NUMERIC);;
  }

  dimension: historical_demand_plan {
    type: number
    sql: ${TABLE}.DemandPlan ;;
  }

  dimension: is_retail_promo {
    type: yesno
    sql: ${TABLE}.IsRetailPromo ;;
  }

  dimension: is_wholesale_promo {
    type: yesno
    sql: ${TABLE}.IsWholesalePromo ;;
  }

  dimension: location_dma {
    type: string
    sql: ${TABLE}.LocationDMA ;;
  }

  dimension: mlforecast_quantity {
    type: string
    sql: CAST(${TABLE}.MLForecastQuantity as NUMERIC) ;;
  }

  dimension: mlforecast_quantity_lower_bound {
    type: string
    sql: CAST(${TABLE}.MLForecastQuantityLowerBound as NUMERIC);;
  }

  dimension: mlforecast_quantity_upper_bound {
    type: string
    sql: CAST(${TABLE}.MLForecastQuantityUpperBound as NUMERIC);;
  }

  dimension: past13_weeks_units_sold {
    type: number
    sql: ${TABLE}.Past13WeeksUnitsSold ;;
  }

  dimension: past52_weeks_units_sold {
    type: number
    sql: ${TABLE}.Past52WeeksUnitsSold ;;
  }

  dimension: product_name {
    type: string
    sql:
      CASE
        WHEN ${TABLE}.ProductName='Watermelon Coolers'
        THEN 'Watermelon Cooler'
        WHEN ${TABLE}.ProductName='Watermelon'
        THEN 'Watermelon Cooler'
        ELSE ${TABLE}.ProductName
      END;;
  }

  dimension: quantity {
    type: string
    sql: CAST(${TABLE}.Quantity as NUMERIC);;
  }

  dimension: retail_price_per_unit {
    type: string
    sql: CAST(${TABLE}.RetailPricePerUnit as NUMERIC);;
  }

  dimension: search_trend {
    type: number
    sql: ${TABLE}.SearchTrend ;;
  }

  dimension: temperature_in_celsius {
    type: number
    sql: ${TABLE}.TemperatureInCelsius ;;
  }

  dimension: temperature_in_fahrenheit {
    type: number
    sql: CAST(${TABLE}.TemperatureInFahrenheit as NUMERIC) ;;
  }

  dimension: wholesale_price_per_item {
    type: string
    sql: ${TABLE}.WholesalePricePerItem ;;
  }

  dimension: url_field {
    hidden: yes
    type: string
    sql:
         CASE
          WHEN ${differential_alert} = 'Forecast Outside Statistical Range' THEN ('36')
          WHEN ${differential_alert} = 'Promo Differential' THEN ('41')
          WHEN ${differential_alert} = 'Storm' THEN ('42')
          WHEN ${differential_alert} like 'Heat%' THEN ('42')
          WHEN ${differential_alert} = 'Non-seasonal Google Trend' THEN ('43')
          ELSE Null
        END ;;
  }
  dimension: alert_dashboard_link{
    hidden: no
    type: string
    sql: ${TABLE}.DifferentialAlert ;;
    link: {
      label: "Detail Dashboard"
      url: "https://cortex.cloud.looker.com/dashboards-next/{{url_field._value}}?Product+Name={{ product_name._value }}&Ship+to+Location={{location_dma._value}}&Customer={{customer_name._value}}"
      icon_url: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/279/magnifying-glass-tilted-left_1f50d.png"
    }
  }

  dimension: wholesale_quantity {
    type: number
    sql: CAST(${TABLE}.WholesaleQuantity AS NUMERIC);;
  }

  dimension: average_temperature {
    type: number
    sql: ${TABLE}.average_temperature;;
  }

  dimension: moving_average_temperature {
    type: number
    sql: ${TABLE}.moving_average_temperature;;
  }

  dimension: delta_temperature {
    type: number
    sql: ${TABLE}.delta_temperature;;
  }

  measure: count {
    type: count
    drill_fields: [product_name, customer_name]
  }

  measure: impact {
    type: average
    sql:${expected_differential_impact};;
  }

  measure: past_13_weeks_units_sold {
    type: sum
    sql: ${past13_weeks_units_sold} ;;
  }

  measure: past_52_weeks_units_sold {
    type: sum
    sql: ${past52_weeks_units_sold} ;;
  }

  measure: thirteen_week_forecast{
    type: sum
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) >= CURRENT_DATE() and DATE_DIFF(Cast(${TABLE}.Date as Date), CURRENT_DATE(), Day)<=91
        THEN ${mlforecast_quantity}
      END ;;
    value_format_name: decimal_0
  }

  measure: thirteen_week_sales_volume{
    type: sum
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) <= CURRENT_DATE() and DATE_DIFF(CURRENT_DATE(), Cast(${TABLE}.Date as Date), Day)<=91
        THEN ${quantity}
      END ;;
    value_format_name: decimal_0
  }

  measure: fifty_two_week_sales_volume{
    type: sum
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) <= CURRENT_DATE() and DATE_DIFF(CURRENT_DATE(), Cast(${TABLE}.Date as Date), Day)<=366
        THEN ${quantity}
      END ;;
    value_format_name: decimal_0
  }

  measure: trend {
    type: average
    sql: ${search_trend} ;;
  }

  measure: temperature {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) < CURRENT_DATE()
        THEN ${temperature_in_fahrenheit}
        ELSE
          NULL
      END;;
  }

  measure: temperature_forecast {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) >= CURRENT_DATE()
        THEN ${temperature_in_fahrenheit}
        ELSE
          NULL
      END;;
  }

  measure: forecast {
    type: average
    sql: ${mlforecast_quantity} ;;
  }

  measure: forecast_lower {
    type: average
    sql: ${mlforecast_quantity_lower_bound};;
  }

  measure: forecast_upper {
    type: average
    sql: ${mlforecast_quantity_upper_bound};;
  }

  measure: demand_plan_before_May  {
    type: average
    sql:
              CASE
                WHEN CAST(${TABLE}.Date AS DATE) < CURRENT_DATE()
                THEN ${historical_demand_plan}
              ELSE
                NULL
              END ;;
    value_format_name:decimal_0
  }

  measure: demand_plan_after_May  {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) >= CURRENT_DATE()
        THEN ${historical_demand_plan}
        ELSE
          NULL
      END ;;
    value_format_name:decimal_0
  }

  measure: wholesale_on_promo{
    type: max
    sql:
      CASE
        WHEN ${is_wholesale_promo} is true THEN 1
        ELSE 0
      END;;
  }

  measure: retail_price {
    type: average
    sql: ${retail_price_per_unit} ;;
  }

  measure: past_sales_quantity {
    type: average
    sql:
     CASE
      WHEN CAST(${TABLE}.Date AS DATE) < CURRENT_DATE()
      THEN round(${quantity})
     ELSE
      NULL
    END;;
  }

  measure: wholesale_quantity_measure {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) < CURRENT_DATE()
        THEN ${wholesale_quantity}
        ELSE
          NULL
      END ;;
  }

  measure: historical_average_temperature {
    type: average
    sql: ${average_temperature};;
  }

  measure: moving_average_tempearture {
    type:  average
    sql:  ${moving_average_temperature};;
  }

  measure: demo_temperature {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) < CURRENT_DATE()
        THEN ${temperature_in_fahrenheit}
        ELSE NULL
      END ;;
  }

  measure: demo_forecast_temperature {
    type: average
    sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) >= CAST ('2021-07-19' AS DATE) AND CAST(${TABLE}.Date AS DATE) < CAST ('2021-07-19' AS DATE)
        THEN ${temperature_in_fahrenheit}
        ELSE NULL
      END ;;
  }

  measure: diff_from_historical_average {
    type: average
    sql: ${delta_temperature};;
  }

}
