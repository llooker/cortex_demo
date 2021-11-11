view: aggregated_results_testharness {
  sql_table_name:
  (

    (WITH tmp AS (
    SELECT
      CustomerName,
      ProductName,
      LocationDMA,
      Date,
      DifferentialAlert,
      Past13WeeksUnitsSold,
      Past52WeeksUnitsSold,
      ExpectedDifferentialImpact,
      ROW_NUMBER() OVER (PARTITION BY
                            CustomerName,
                            ProductName,
                            LocationDMA
                      ORDER BY DATE ASC) as rank
    FROM `looker-private-demo.TestHarness_CortexIntelligence.AggregatedResults`
    WHERE DifferentialAlert = 'Forecast Outside Statistical Range'
    AND CAST (DATE AS DATE) > CAST ('2021-05-23' AS DATE)
    )
   SELECT * EXCEPT (rank)
   FROM tmp
   WHERE rank = 1)

   UNION ALL

  SELECT
      CustomerName,
      ProductName,
      LocationDMA,
      Date,
      DifferentialAlert,
      Past13WeeksUnitsSold,
      Past52WeeksUnitsSold,
      ExpectedDifferentialImpact
    FROM `looker-private-demo.TestHarness_CortexIntelligence.AggregatedResults`
    WHERE DifferentialAlert = 'Promo Differential'

    UNION ALL

    SELECT
      CustomerName,
      ProductName,
      LocationDMA,
      Date,
      DifferentialAlert,
      Past13WeeksUnitsSold,
      Past52WeeksUnitsSold,
      ExpectedDifferentialImpact
    FROM `looker-private-demo.TestHarness_CortexIntelligence.AggregatedResults`
    WHERE DifferentialAlert = 'Heat Wave'

    UNION ALL

    SELECT
      CustomerName,
      ProductName,
      LocationDMA,
      Date,
      DifferentialAlert,
      Past13WeeksUnitsSold,
      Past52WeeksUnitsSold,
      ExpectedDifferentialImpact
    FROM
     (SELECT *,
            ROW_NUMBER() OVER (PARTITION BY
                            CustomerName,
                            ProductName,
                            LocationDMA) AS rank
      FROM
        `looker-private-demo.TestHarness_CortexIntelligence.AggregatedResults`
      WHERE DifferentialAlert = 'Non-seasonal Google Trend'
      AND CAST(Date as DATE) < CAST('2021-05-23' AS DATE)
    ) as tb
    WHERE rank=1


  )

    ;;

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

    dimension: location_dma {
      type: string
      sql: ${TABLE}.LocationDMA ;;
    }

    dimension: mlforecast_quantity {
      type: string
      sql: CAST(${TABLE}.MLForecastQuantity as NUMERIC) ;;
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
          url: "/dashboards-next/{{url_field._value}}?Product+Name={{ product_name._value }}&Customer={{customer_name._value}}&Ship+to+Location={{location_dma._value}}"
          icon_url: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/279/magnifying-glass-tilted-left_1f50d.png"
        }
      }

      dimension: url_field_2 {
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
        dimension: alert_dashboard_link_2{
          hidden: no
          type: string
          sql: ${TABLE}.DifferentialAlert ;;
          link: {
            label: "Detail Dashboard"
            url: "/dashboards-next/{{url_field_2._value}}?Product+Name={{ product_name._value }}&Ship+to+Location={{location_dma._value}}&Customer={{customer_name._value}}"
            icon_url: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/279/magnifying-glass-tilted-left_1f50d.png"
          }
        }

        measure: count {
          type: count
          drill_fields: [product_name, customer_name]
        }

        measure: impact_score {
          type: average
          sql:
          CASE
            WHEN ${TABLE}.ProductName like 'Watermelon%'
            AND ${TABLE}.CustomerName='Bulls Eye'
            AND ${TABLE}.LocationDMA like 'Boston%'
            AND CAST(${TABLE}.Date AS DATE) = CAST('2021-05-23' AS DATE)
            AND ${TABLE}.DifferentialAlert ='Forecast Outside Statistical Range'
            THEN 10
            WHEN ${TABLE}.ProductName like 'Watermelon%'
            AND ${TABLE}.CustomerName='Bulls Eye'
            AND ${TABLE}.LocationDMA like 'Boston%'
            AND ${TABLE}.DifferentialAlert='Promo Differential'
            THEN 95
            WHEN ${TABLE}.ProductName = 'Mayo'
            AND ${TABLE}.CustomerName='Bulls Eye'
            AND ${TABLE}.LocationDMA like 'Boston%'
            THEN 93
            WHEN ${TABLE}.ProductName like 'BBQ chips'
            AND ${TABLE}.CustomerName='Bulls Eye'
            AND ${TABLE}.LocationDMA like 'Boston%'
            AND ${TABLE}.DifferentialAlert like '%Google%'
            THEN 90
          ELSE
            ${expected_differential_impact}
            END ;;
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
                WHEN CAST(${TABLE}.Date AS DATE) >= CAST ('2021-05-23' AS DATE) and DATE_DIFF(Cast(${TABLE}.Date as Date), CAST ('2021-05-23' AS DATE), Day)<=91
                THEN ${mlforecast_quantity}
              END ;;
          value_format_name: decimal_0
        }


        measure: thirteen_week_sales_volume{
          type: sum
          sql:
              CASE
                WHEN CAST(${TABLE}.Date AS DATE) <= CAST ('2021-05-23' AS DATE) and DATE_DIFF(CAST ('2021-05-23' AS DATE), Cast(${TABLE}.Date as Date), Day)<=91
                THEN ${quantity}
              END ;;
          value_format_name: decimal_0
        }

        measure: fifty_two_week_sales_volume{
          type: sum
          sql:
              CASE
                WHEN CAST(${TABLE}.Date AS DATE) <= CAST ('2021-05-23' AS DATE) and DATE_DIFF(CAST ('2021-05-23' AS DATE), Cast(${TABLE}.Date as Date), Day)<=366
                THEN ${quantity}
              END ;;
          value_format_name: decimal_0
        }

      }
