- dashboard: alert_summary
  title: Demand sensing - Alerts Summary Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Alerts_Table
    name: Alerts_Table
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    type: looker_grid
    fields: [aggregated_results_dev_v2.product_name, aggregated_results_dev_v2.customer_name,
      aggregated_results_dev_v2.location_dma, aggregated_results_dev_v2.date_date,
      aggregated_results_dev_v2.alert_dashboard_link, aggregated_results_dev_v2.impact_score,
      aggregated_results_dev_v2.past_13_weeks_units_sold, aggregated_results_dev_v2.past_52_weeks_units_sold]
    filters:
      aggregated_results_dev_v2.alert_dashboard_link: "-NULL"
    sorts: [aggregated_results_dev_v2.impact_score desc, aggregated_results_dev_v2.date_date
        desc, aggregated_results_dev_v2.location_dma desc, aggregated_results_dev_v2.customer_name
        desc, aggregated_results_dev_v2.product_name desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      aggregated_results_dev_v2.product_name: Product Name
      aggregated_results_dev_v2.customer_name: Customer
      aggregated_results_dev_v2.location_dma: Ship to Location
      aggregated_results_dev_v2.date_date: Date
      aggregated_results_dev_v2.alert_dashboard_link: Alert Dashboard Link
      aggregated_results_dev_v2.impact: Impact
      aggregated_results_dev_v2.past_13_weeks_units_sold: 13-Week Customer Sales
      aggregated_results_dev_v2.past_52_weeks_units_sold: 52-Week Customer Sales
    series_cell_visualizations:
      aggregated_results_dev_v2.impact:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 10, stepped: true,
            constraints: {min: {type: number, value: 0}}}}, bold: false, italic: false,
        strikethrough: false, fields: [aggregated_results_dev_v2.impact_score]}]
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
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen:
      Product Name: aggregated_results_dev_v2.product_name
      Customer Name: aggregated_results_dev_v2.customer_name
      Date Range: aggregated_results_dev_v2.date_date
      Impact Score: aggregated_results_dev_v2.expected_differential_impact
      Alert Type: aggregated_results_dev_v2.differential_alert
      Ship to Location: aggregated_results_dev_v2.location_dma
    row: 0
    col: 0
    width: 24
    height: 14
  filters:
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: ''
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
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.product_name
  - name: Customer Name
    title: Customer Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Bulls Eye
      - Complete Foods
      - Supermart
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.customer_name
  - name: Ship to Location
    title: Ship to Location
    type: field_filter
    default_value: ''
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
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.location_dma
  - name: Alert Type
    title: Alert Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
      options:
      - Forecast Outside Statistical Range
      - Heat Wave
      - Non-seasonal Google Trend
      - Promo Differential
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.differential_alert
  - name: Impact Score
    title: Impact Score
    type: field_filter
    default_value: "[0,100]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options: []
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.expected_differential_impact
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 2020/01/01 to 2022/09/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cortex_dem_sens
    explore: aggregated_results_dev_v2
    listens_to_filters: []
    field: aggregated_results_dev_v2.date_date