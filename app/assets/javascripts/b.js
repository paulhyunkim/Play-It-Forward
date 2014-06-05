
$(document).ready(function(){

	$('#introbox #play').hide().fadeIn(2000);
	$('#introbox h2').hide().delay(700).fadeIn(2000);

// ----------------------------------------------------

}); //closes document.ready
$(function(){ $(document).foundation(); });



//Nav bar fade. Disappear by 2nd div.
$(function(){
    var fadeBegin = 500, 
    fadeFinish = 690, 
    fadingElement = $('.nav');

$(window).on('scroll', function(){
    var offset = $(document).scrollTop(), opacity = 0; 
    if( offset <= fadeBegin ){
        opacity = 1; 
    } else if( offset <= fadeFinish ){
        opacity = 1 - offset / fadeFinish;

    }
    fadingElement.css('opacity',opacity);
});
    
    });


//Scroll to top div
  $(document).ready(function(){
    $('a[href="#introbox"]').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      && location.hostname == this.hostname) {
        var $target = $(this.hash);
        $target = $target.length && $target
        || $('[name=' + this.hash.slice(1) +']');
        if ($target.length) {
          var targetOffset = $target.offset().top;
          $('html,body')
          .animate({scrollTop: targetOffset}, 1000);
         return false;
        }
      }
    });
  });



//Scroll to second div
  $(document).ready(function(){
    $('a[href="#whoarewe"]').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      && location.hostname == this.hostname) {
        var $target = $(this.hash);
        $target = $target.length && $target
        || $('[name=' + this.hash.slice(1) +']');
        if ($target.length) {
          var targetOffset = $target.offset().top;
          $('html,body')
          .animate({scrollTop: targetOffset}, 1000);
         return false;
        }
      }
    });
  });

//Scroll to bottom div
  $(document).ready(function(){
    $('a[href="#signup"]').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
      && location.hostname == this.hostname) {
        var $target = $(this.hash);
        $target = $target.length && $target
        || $('[name=' + this.hash.slice(1) +']');
        if ($target.length) {
          var targetOffset = $target.offset().top;
          $('html,body')
          .animate({scrollTop: targetOffset}, 1000);
         return false;
        }
      }
    });
  });
  