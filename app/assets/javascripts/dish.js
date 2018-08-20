(function() {
  jQuery(function() {
    var dishes;
    dishes = $('#menu_detail_dish_id').html();
    return $('#menu_detail_category_id').change(function() {
      var category, options;
      category = $('#menu_detail_category_id :selected').text();
      options = $(dishes).filter("optgroup[label='" + category + "']").html();
      if (options) {
        return $('#menu_detail_dish_id').html(options);
      } else {
        return $('#menu_detail_dish_id').empty();
      }
    });
  });
}).call(this);
