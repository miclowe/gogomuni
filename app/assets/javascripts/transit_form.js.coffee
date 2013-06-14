
jQuery ->
  directions = $('#transit_direction_id').html()
  $('#transit_route_id').change ->
    route_id = $('#transit_route_id :selected').val()
    options = $(directions).filter("optgroup[label=#{route_id}]").html()
    console.log(options)
    if options
      $('#transit_direction_id').html(options)
      $('#transit_direction_id').trigger "change"
    else
      $('#transit_direction_id').empty()
      $('#transit_direction_id').trigger "change"
      $('#transit_direction_id').parent().hide()

  stops = $('#transit_stop_id').html()
  $('#transit_direction_id').change ->
    direction_id = $('#transit_direction_id :selected').val()
    options = $(stops).filter("optgroup[label=#{direction_id}]").html()
    console.log(options)
    if options
      $('#transit_stop_id').html(options)
    else
      $('#transit_stop_id').empty()