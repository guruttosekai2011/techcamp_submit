$(function($) {

  console.log('ok');

  var board = $('.show-memo');

  var size_offset = screen.width;
  var border_x = 1200;
  
  if ( size_offset < border_x ) {
    board.addClass('expand-box');
  } else {
    board.removeClass('expand-box');
  }

});
