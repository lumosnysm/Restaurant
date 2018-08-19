jQuery ->
  dishes = $('#menudetail_dish_id').html()
  $('#menudetail_category_id').change ->
    category = $('#menudetail_category_id :selected').text()
    options = $(dishes).filter("optgroup[label='#{category}']").html()
    if options
      $('#menudetail_dish_id').html(options)
    else
      $('#menudetail_dish_id').empty()
