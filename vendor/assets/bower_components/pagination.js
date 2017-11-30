
$(window).scroll(function(){
var url = $('.pagination .next_page').attr('href');
console.log(url);
  if ( ( $(window).scrollTop() > ( ($(window).height() ) - 50) ) ){
    $('.pagination').text("Fetching .....");
       $.getScript($('.pagination .next_page').attr('href'));
             }
                 });
