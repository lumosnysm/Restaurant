$('#keywords_search').on('focus keyup', function () {
  var sub_keywords = $(this).val();
  if (sub_keywords !== '') {
    $('.ul-result_search').css('display', 'block');
    $.ajax({
      url: '/search',
      method: 'GET',
      data: {sub_keywords: $.trim(sub_keywords)}
    })
  } else {
    $('.ul-result_search').css('display', 'none');
  }
})
