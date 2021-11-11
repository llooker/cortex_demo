- dashboard: alert_detail_trends
  title: Demand Shaping - Alerts Detail Dashboard (Trends)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<a href=\"https://cortex.cloud.looker.com/dashboards-next/34?Product%20Name=&Customer=&Alert=&Impact=%5B0,20%5D&Ship%20to%20Location=&Sales%20Week=2017%2F01%2F01%20to%202021%2F05%2F02\"\
      >\n<strong>Home</strong>\n</a> "
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Temperature
    name: Temperature
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: looker_line
    fields: [aggregated_results_dev_v2_2.temperature, aggregated_results_dev_v2_2.date_week,
      aggregated_results_dev_v2_2.past_sales_quantity, aggregated_results_dev_v2_2.wholesale_quantity_measure,
      aggregated_results_dev_v2_2.temperature_forecast, aggregated_results_dev_v2_2.moving_average_tempearture,
      aggregated_results_dev_v2_2.forecast, aggregated_results_dev_v2_2.forecast_lower,
      aggregated_results_dev_v2_2.forecast_upper, aggregated_results_dev_v2_2.demand_plan_after_May]
    fill_fields: [aggregated_results_dev_v2_2.date_week]
    sorts: [aggregated_results_dev_v2_2.date_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Temperature (F), orientation: left, series: [{axisId: aggregated_results_dev_v2_2.temperature,
            id: aggregated_results_dev_v2_2.temperature, name: Temperature}, {axisId: aggregated_results_dev_v2_2.temperature_forecast,
            id: aggregated_results_dev_v2_2.temperature_forecast, name: Temperature
              Forecast}, {axisId: aggregated_results_dev_v2_2.moving_average_tempearture,
            id: aggregated_results_dev_v2_2.moving_average_tempearture, name: Moving
              Average Tempearture}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: Quantity,
        orientation: right, series: [{axisId: aggregated_results_dev_v2_2.past_sales_quantity,
            id: aggregated_results_dev_v2_2.past_sales_quantity, name: Retail Units
              Sold}, {axisId: aggregated_results_dev_v2_2.forecast, id: aggregated_results_dev_v2_2.forecast,
            name: Forecast}, {axisId: aggregated_results_dev_v2_2.wholesale_quantity_measure,
            id: aggregated_results_dev_v2_2.wholesale_quantity_measure, name: Customer
              Units Sold}, {axisId: aggregated_results_dev_v2_2.forecast_lower, id: aggregated_results_dev_v2_2.forecast_lower,
            name: Forecast Lower}, {axisId: aggregated_results_dev_v2_2.forecast_upper,
            id: aggregated_results_dev_v2_2.forecast_upper, name: Forecast Upper},
          {axisId: aggregated_results_dev_v2_2.demand_plan_after_May, id: aggregated_results_dev_v2_2.demand_plan_after_May,
            name: Demand Plan After May}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    series_types:
      aggregated_results_dev_v2_2.temperature: column
      aggregated_results_dev_v2_2.temperature_forecast: column
    series_colors:
      aggregated_results_dev_v2_2.temperature: "#54c2cc"
      aggregated_results_dev_v2_2.past_sales_quantity: "#F9AB00"
      aggregated_results_dev_v2_2.wholesale_quantity_measure: "#1A73E8"
      aggregated_results_dev_v2_2.temperature_forecast: "#a7ccc2"
      aggregated_results_dev_v2_2.moving_average_tempearture: "#80868B"
      aggregated_results_dev_v2_2.forecast_lower: "#c8de9d"
      aggregated_results_dev_v2_2.forecast_upper: "#c8de9d"
      aggregated_results_dev_v2_2.demand_plan_after_May: "#EA4335"
    series_labels:
      aggregated_results_dev_v2_2.past_sales_quantity: Retail Units Sold
      aggregated_results_dev_v2_2.wholesale_quantity_measure: Customer Units Sold
      aggregated_results_dev_v2_2.moving_average_tempearture: Historical Average Temperature
      aggregated_results_dev_v2_2.forecast_lower: Forecast Lower Bound
      aggregated_results_dev_v2_2.forecast_upper: Bound
      aggregated_results_dev_v2_2.demand_plan_after_May: Total Demand Plan
    x_axis_datetime_label: "%b %Y"
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 8
    col: 0
    width: 6
    height: 4
  - title: Customer Units Sold - Historical & Forecast
    name: Customer Units Sold - Historical & Forecast
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: looker_line
    fields: [aggregated_results_dev_v2_2.date_week, aggregated_results_dev_v2_2.demand_plan_after_May,
      aggregated_results_dev_v2_2.forecast, aggregated_results_dev_v2_2.forecast_lower,
      aggregated_results_dev_v2_2.forecast_upper, aggregated_results_dev_v2_2.wholesale_quantity_measure]
    fill_fields: [aggregated_results_dev_v2_2.date_week]
    sorts: [aggregated_results_dev_v2_2.date_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Quantity, orientation: left, series: [{axisId: aggregated_results_dev_v2_2.demand_plan_after_May,
            id: aggregated_results_dev_v2_2.demand_plan_after_May, name: Total Demand
              Plan}, {axisId: aggregated_results_dev_v2_2.forecast, id: aggregated_results_dev_v2_2.forecast,
            name: Forecast}, {axisId: aggregated_results_dev_v2_2.forecast_lower,
            id: aggregated_results_dev_v2_2.forecast_lower, name: Forecast Lower Bound},
          {axisId: aggregated_results_dev_v2_2.forecast_upper, id: aggregated_results_dev_v2_2.forecast_upper,
            name: Forecast Upper Bound}, {axisId: aggregated_results_dev_v2_2.wholesale_quantity_measure,
            id: aggregated_results_dev_v2_2.wholesale_quantity_measure, name: Total
              Historical Sales Quantity}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      aggregated_results_dev_v2_2.demand_plan_after_May: "#EA4335"
      aggregated_results_dev_v2_2.forecast: "#7CB342"
      aggregated_results_dev_v2_2.forecast_lower: "#c8de9d"
      aggregated_results_dev_v2_2.forecast_upper: "#c8de9d"
      aggregated_results_dev_v2_2.wholesale_quantity_measure: "#1A73E8"
    series_labels:
      aggregated_results_dev_v2_2.demand_plan_after_May: Total Demand Plan
      aggregated_results_dev_v2_2.forecast: Forecast
      aggregated_results_dev_v2_2.forecast_lower: Forecast Lower Bound
      aggregated_results_dev_v2_2.forecast_upper: Forecast Upper Bound
      aggregated_results_dev_v2_2.wholesale_quantity_measure: Customer Units Sold
    x_axis_datetime_label: "%b %Y"
    defaults_version: 1
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 8
    col: 6
    width: 6
    height: 4
  - title: Google Trends Insights
    name: Google Trends Insights
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: looker_line
    fields: [aggregated_results_dev_v2_2.date_week, aggregated_results_dev_v2_2.trend,
      aggregated_results_dev_v2_2.past_sales_quantity, aggregated_results_dev_v2_2.wholesale_quantity_measure,
      aggregated_results_dev_v2_2.demand_plan_after_May, aggregated_results_dev_v2_2.forecast,
      aggregated_results_dev_v2_2.forecast_lower, aggregated_results_dev_v2_2.forecast_upper]
    fill_fields: [aggregated_results_dev_v2_2.date_week]
    sorts: [aggregated_results_dev_v2_2.date_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: aggregated_results_dev_v2_2.trend,
            id: aggregated_results_dev_v2_2.trend, name: Trend}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: aggregated_results_dev_v2_2.wholesale_quantity_measure,
            id: aggregated_results_dev_v2_2.wholesale_quantity_measure, name: Total
              Historical Sales Quantity}, {axisId: aggregated_results_dev_v2_2.past_sales_quantity,
            id: aggregated_results_dev_v2_2.past_sales_quantity, name: Retail Units
              Sold}, {axisId: aggregated_results_dev_v2_2.demand_plan_after_May, id: aggregated_results_dev_v2_2.demand_plan_after_May,
            name: Total Demand Plan}, {axisId: aggregated_results_dev_v2_2.forecast,
            id: aggregated_results_dev_v2_2.forecast, name: Forecast}, {axisId: aggregated_results_dev_v2_2.forecast_lower,
            id: aggregated_results_dev_v2_2.forecast_lower, name: Forecast Lower Bound},
          {axisId: aggregated_results_dev_v2_2.forecast_upper, id: aggregated_results_dev_v2_2.forecast_upper,
            name: Forecast Upper Bound}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      aggregated_results_dev_v2_2.forecast: "#7CB342"
      aggregated_results_dev_v2_2.forecast_upper: "#c8de9d"
      aggregated_results_dev_v2_2.forecast_lower: "#c8de9d"
      aggregated_results_dev_v2_2.wholesale_quantity_measure: "#1A73E8"
      aggregated_results_dev_v2_2.demand_plan_after_May: "#EA4335"
      aggregated_results_dev_v2_2.trend: "#E52592"
      aggregated_results_dev_v2_2.past_sales_quantity: "#F9AB00"
    series_labels:
      aggregated_results_dev_v2_2.forecast: Forecast
      aggregated_results_dev_v2_2.forecast_upper: Forecast Upper Bound
      aggregated_results_dev_v2_2.forecast_lower: Forecast Lower Bound
      aggregated_results_dev_v2_2.wholesale_quantity_measure: Customer Units Sold
      aggregated_results_dev_v2_2.demand_plan_after_May: Total Demand Plan
      aggregated_results_dev_v2_2.past_sales_quantity: Retail Units Sold
    x_axis_datetime_label: "%b %Y"
    defaults_version: 1
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 0
    col: 4
    width: 20
    height: 8
  - title: Syndicated Point-of-Sale Data
    name: Syndicated Point-of-Sale Data
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: looker_line
    fields: [aggregated_results_dev_v2_2.date_week, aggregated_results_dev_v2_2.past_sales_quantity,
      aggregated_results_dev_v2_2.retail_price, aggregated_results_dev_v2_2.demand_plan_after_May,
      aggregated_results_dev_v2_2.wholesale_quantity_measure, aggregated_results_dev_v2_2.wholesale_on_promo]
    fill_fields: [aggregated_results_dev_v2_2.date_week]
    sorts: [aggregated_results_dev_v2_2.date_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Quantity, orientation: left, series: [{axisId: aggregated_results_dev_v2_2.past_sales_quantity,
            id: aggregated_results_dev_v2_2.past_sales_quantity, name: Retail Units
              Sold}, {axisId: aggregated_results_dev_v2_2.wholesale_quantity_measure,
            id: aggregated_results_dev_v2_2.wholesale_quantity_measure, name: Direct
              Units Sold}, {axisId: aggregated_results_dev_v2_2.demand_plan_after_May,
            id: aggregated_results_dev_v2_2.demand_plan_after_May, name: Direct Unit
              Sales Forecast}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: Retail Price ($), orientation: right, series: [{axisId: aggregated_results_dev_v2_2.retail_price,
            id: aggregated_results_dev_v2_2.retail_price, name: Retail Price per Unit
              ($)}], showLabels: true, showValues: true, minValue: -3, valueFormat: '0[>0];[<0]',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: aggregated_results_dev_v2_2.wholesale_on_promo,
            id: aggregated_results_dev_v2_2.wholesale_on_promo, name: Wholesale on
              Promotion}], showLabels: false, showValues: false, maxValue: 1, minValue: 0,
        valueFormat: '0[>0];[<0]', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      aggregated_results_dev_v2_2.wholesale_on_promo: column
    series_colors:
      aggregated_results_dev_v2_2.past_sales_quantity: "#F9AB00"
      aggregated_results_dev_v2_2.retail_price: "#80868B"
      aggregated_results_dev_v2_2.demand_plan_after_May: "#EA4335"
      aggregated_results_dev_v2_2.wholesale_quantity_measure: "#1A73E8"
      aggregated_results_dev_v2_2.wholesale_on_promo: "#cfd8de"
    series_labels:
      aggregated_results_dev_v2_2.past_sales_quantity: Retail Units Sold
      aggregated_results_dev_v2_2.retail_price: Retail Price per Unit ($)
      aggregated_results_dev_v2_2.demand_plan_after_May: Direct Unit Sales Forecast
      aggregated_results_dev_v2_2.wholesale_quantity_measure: Customer Units Sold
      aggregated_results_dev_v2_2.wholesale_on_promo: Wholesale on Promotion
    x_axis_datetime_label: "%b %Y"
    defaults_version: 1
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 8
    col: 18
    width: 6
    height: 4
  - title: KPI
    name: KPI
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [aggregated_results_dev_v2_2.thirteen_week_forecast, aggregated_results_dev_v2_2.thirteen_week_sales_volume,
      aggregated_results_dev_v2_2.fifty_two_week_sales_volume]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: '10'
    orientation: vertical
    dividers: false
    style_aggregated_results_dev_v2_2.thirteen_week_forecast: "#3A4245"
    show_title_aggregated_results_dev_v2_2.thirteen_week_forecast: true
    title_override_aggregated_results_dev_v2_2.thirteen_week_forecast: 13-Week Forecast
    title_placement_aggregated_results_dev_v2_2.thirteen_week_forecast: below
    value_format_aggregated_results_dev_v2_2.thirteen_week_forecast: ''
    style_aggregated_results_dev_v2_2.thirteen_week_sales_volume: "#3A4245"
    show_title_aggregated_results_dev_v2_2.thirteen_week_sales_volume: true
    title_override_aggregated_results_dev_v2_2.thirteen_week_sales_volume: 13-Week
      Customer Sales Units
    title_placement_aggregated_results_dev_v2_2.thirteen_week_sales_volume: below
    value_format_aggregated_results_dev_v2_2.thirteen_week_sales_volume: ''
    show_comparison_aggregated_results_dev_v2_2.thirteen_week_sales_volume: false
    style_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: "#3A4245"
    show_title_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: true
    title_override_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: 52-Week
      Customer Sales Units
    title_placement_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: below
    value_format_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: ''
    show_comparison_aggregated_results_dev_v2_2.fifty_two_week_sales_volume: false
    show_comparison_aggregated_results_dev_v2_2.thirteen_week_forecast: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    title_hidden: true
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 2
    col: 0
    width: 4
    height: 6
  - title: Ads
    name: Ads
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    type: looker_line
    fields: [aggregated_results_dev_v2_2.date_week, aggregated_results_dev_v2_2.past_sales_quantity,
      aggregated_results_dev_v2_2.ads_uplift_units_measure, aggregated_results_dev_v2_2.ads_impressions_historical_measure,
      aggregated_results_dev_v2_2.ads_impressions_plan_measure, aggregated_results_dev_v2_2.demand_plan_after_May,
      aggregated_results_dev_v2_2.forecast, aggregated_results_dev_v2_2.forecast_lower,
      aggregated_results_dev_v2_2.forecast_upper, aggregated_results_dev_v2_2.wholesale_quantity_measure]
    fill_fields: [aggregated_results_dev_v2_2.date_week]
    sorts: [aggregated_results_dev_v2_2.date_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Quantity, orientation: left, series: [{axisId: aggregated_results_dev_v2_2.past_sales_quantity,
            id: aggregated_results_dev_v2_2.past_sales_quantity, name: Retail Units
              Sold}, {axisId: aggregated_results_dev_v2_2.ads_uplift_units_measure,
            id: aggregated_results_dev_v2_2.ads_uplift_units_measure, name: Estimated
              Retail Uplift from Ads}, {axisId: aggregated_results_dev_v2_2.demand_plan_after_May,
            id: aggregated_results_dev_v2_2.demand_plan_after_May, name: Direct Unit
              Sales Forecast}, {axisId: aggregated_results_dev_v2_2.forecast, id: aggregated_results_dev_v2_2.forecast,
            name: Forecast}, {axisId: aggregated_results_dev_v2_2.forecast_lower,
            id: aggregated_results_dev_v2_2.forecast_lower, name: Forecast Lower},
          {axisId: aggregated_results_dev_v2_2.forecast_upper, id: aggregated_results_dev_v2_2.forecast_upper,
            name: Forecast Upper}, {axisId: aggregated_results_dev_v2_2.wholesale_quantity_measure,
            id: aggregated_results_dev_v2_2.wholesale_quantity_measure, name: Customer
              Units Sold}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: Ads Impressions
          (M), orientation: right, series: [{axisId: aggregated_results_dev_v2_2.ads_impressions_historical_measure,
            id: aggregated_results_dev_v2_2.ads_impressions_historical_measure, name: Ads
              Impressions Historical (M)}, {axisId: aggregated_results_dev_v2_2.ads_impressions_plan_measure,
            id: aggregated_results_dev_v2_2.ads_impressions_plan_measure, name: Ads
              Impressions Planned (M)}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      aggregated_results_dev_v2_2.ads_uplift_units_measure: "#FF8168"
      aggregated_results_dev_v2_2.ads_impressions_historical_measure: "#80868B"
      aggregated_results_dev_v2_2.ads_impressions_plan_measure: "#9334E6"
      aggregated_results_dev_v2_2.forecast: "#7CB342"
      aggregated_results_dev_v2_2.forecast_lower: "#c8de9d"
      aggregated_results_dev_v2_2.forecast_upper: "#c8de9d"
      aggregated_results_dev_v2_2.past_sales_quantity: "#F9AB00"
      aggregated_results_dev_v2_2.wholesale_quantity_measure: "#1A73E8"
      aggregated_results_dev_v2_2.demand_plan_after_May: "#EA4335"
    series_labels:
      aggregated_results_dev_v2_2.ads_uplift_units_measure: Estimated Retail Uplift
        from Ads
      aggregated_results_dev_v2_2.ads_impressions_historical_measure: Ads Impressions
        Historical (M)
      aggregated_results_dev_v2_2.ads_impressions_plan_measure: Ads Impressions Planned
        (M)
      aggregated_results_dev_v2_2.past_sales_quantity: Retail Units Sold
      aggregated_results_dev_v2_2.wholesale_quantity_measure: Customer Units Sold
      aggregated_results_dev_v2_2.demand_plan_after_May: Demand Plan
    x_axis_datetime_label: "%b %Y"
    defaults_version: 1
    listen:
      Product Name: aggregated_results_dev_v2_2.product_name
      Customer: aggregated_results_dev_v2_2.customer_name
      Ship to Location: aggregated_results_dev_v2_2.location_dma
      Date Range: aggregated_results_dev_v2_2.date_week
    row: 8
    col: 12
    width: 6
    height: 4
  filters:
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Paper towels
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - BBQ chips
      - BBQ sauce
      - Beer
      - Bubbles
      - Bug spray
      - Hamburger buns
      - Hamburgers
      - Hot dog buns
      - Hot dogs
      - Kabobs
      - Lemonade
      - Mayo
      - Paper plates
      - Paper towels
      - Pasta Salad
      - Plastic cups
      - Plastic utensils
      - Potato Salad
      - Sunscreen
      - Toothpicks
      - Tortilla chips
      - Watermelon Cooler
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    listens_to_filters: []
    field: aggregated_results_dev_v2_2.product_name
  - name: Customer
    title: Customer
    type: field_filter
    default_value: Bulls Eye
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Bulls Eye
      - Complete Foods
      - Supermart
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    listens_to_filters: []
    field: aggregated_results_dev_v2_2.customer_name
  - name: Ship to Location
    title: Ship to Location
    type: field_filter
    default_value: Boston
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Atlanta
      - Boston
      - Chicago
      - Cleveland
      - Dallas
      - Detroit
      - Las Vegas
      - Los Angeles
      - Minneapolis
      - New York City
      - Philadelphia
      - Portland
      - San Francisco
      - Seattle
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    listens_to_filters: []
    field: aggregated_results_dev_v2_2.location_dma
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 2019/01/01 to 2021/08/02
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cortex_dev_v2
    explore: aggregated_results_dev_v2_2
    listens_to_filters: []
    field: aggregated_results_dev_v2_2.date_date
