$(function($) {
  
  var tab = $('.subbar');
  var maincon = $('.maincon');
  var van = $('.subcon');
  var offset = tab.offset();
  var main_offset = $('.maincon').offset();
  var h = $(window).height();
  var w = $(window).width();
  var border_x = 1200;

  var flag = 0;

  var size_offset = screen.width;
  

  if ( size_offset < border_x ) {
    van.addClass('vanish-box');
    maincon.addClass('mini-font');
  } else {
    van.removeClass('vanish-box');
  }

  $(window).resize(function() {
    
    w = $(window).width();

    if( w < border_x ) {
      van.addClass('vanish-box');
      maincon.addClass('mini-font');
    } else {
      van.removeClass('vanish-box');
      maincon.removeClass('mini-font');
    }

  });
  
  
  $(window).scroll(function () {

    if($(window).scrollTop() > offset.top + 300 ) {
      tab.addClass('fixed');
    } else {
      tab.removeClass('fixed');
    }

    if(($(window).scrollTop() + h - 480 ) > (main_offset.top + $('.maincon').height())) { 
      tab.removeClass('fixed');
      tab.addClass('fixed-bottom');
      $('.subbar').css("margin-top", main_offset.top + $('.maincon').height() - 620);
    } else {
      tab.removeClass('fixed-bottom');
      $('.subbar').css("margin-top", "0px");
    }


  });
});

