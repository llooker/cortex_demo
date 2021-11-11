view: aggregated_results_dev {
  sql_table_name: `looker-private-demo.DemoIntelligence.AggregatedResultsDev`
    ;;

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
    sql: ${TABLE}.DemandPlan ;;
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
    sql: ${TABLE}.HistoricalDemandPlan ;;
  }

  dimension: is_retail_promo {
    type: string
    sql: ${TABLE}.IsRetailPromo ;;
  }

  dimension: is_wholesale_promo {
    type: number
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
    sql: ${TABLE}.TemperatureInFahrenheit ;;
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
          WHEN ${differential_alert} = 'Forecast Outside Statistical Range' THEN ('21')
          WHEN ${differential_alert} = 'Promo Differential' THEN ('22')
          WHEN ${differential_alert} = 'Storm' THEN ('23')
          WHEN ${differential_alert} like 'Heat%' THEN ('23')
          WHEN ${differential_alert} = 'Non-seasonal Google Trend' THEN ('24')
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

  dimension: url_field_2 {
    hidden: yes
    type: string
    sql:
        CASE
          WHEN ${differential_alert} = 'Forecast Outside Statistical Range' THEN ('11')
          WHEN ${differential_alert} = 'Promo Differential' THEN ('8')
          WHEN ${differential_alert} like 'Storm%' THEN ('14')
          WHEN ${differential_alert} like 'Heat%' THEN ('14')
          WHEN ${differential_alert} = 'Non-seasonal Google Trend' THEN ('16')
          ELSE Null
        END ;;

    }
    dimension: alert_dashboard_link_2{
      hidden: no
      type: string
      sql: ${TABLE}.DifferentialAlert ;;
      link: {
        label: "Detail Dashboard"
        url: "https://cortex.cloud.looker.com/dashboards-next/{{url_field_2._value}}?Product+Name={{ product_name._value }}&Ship+to+Location={{location_dma._value}}&Customer={{customer_name._value}}"
        icon_url: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/279/magnifying-glass-tilted-left_1f50d.png"
      }
    }

    dimension: wholesale_quantity {
      type: number
      sql: ${TABLE}.WholesaleQuantity;;
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

    # measure: thirteen_week_sales_volume {
    #   type: sum
    #   sql: ${past13_weeks_units_sold};;
    # }

    # measure: fifty_two_week_sales_volume{
    #   type: sum
    #   sql: ${past52_weeks_units_sold};;
    # }

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
      sql: ${temperature_in_fahrenheit};;
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
        WHEN CAST(${TABLE}.Date AS DATE) < CAST('2021-04-26' AS DATE)
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
        WHEN CAST(${TABLE}.Date AS DATE) >= CAST('2021-04-26' AS DATE)
        THEN ${historical_demand_plan}
      ELSE
        NULL
      END ;;
      value_format_name:decimal_0
    }

    measure: wholesale_on_promo{
      type: average
      sql: ${is_wholesale_promo} ;;
    }

    measure: retail_price {
      type: average
      sql: ${retail_price_per_unit} ;;
    }

    measure: past_sales_quantity {
      type: average
      sql: ${quantity};;
    }

    measure: wholesale_quantity_measure {
      type: average
      sql:
      CASE
        WHEN CAST(${TABLE}.Date AS DATE) < CAST('2021-04-26' AS DATE)
        THEN ${wholesale_quantity}
      ELSE
        NULL
      END ;;

    }
  }
