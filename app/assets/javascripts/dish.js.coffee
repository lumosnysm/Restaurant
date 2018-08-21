jQuery ->
  dishes = $('#menu_detail_dish_id').html()
  console.log(dishes)
  $('#menu_detail_category_id').change ->
    category = $('#menu_detail_category_id :selected').text()
    options = $(dishes).filter("optgroup[label='#{category}']").html()
    if options
      $('#menu_detail_dish_id').html(options)
    else
      $('#menu_detail_dish_id').empty()
