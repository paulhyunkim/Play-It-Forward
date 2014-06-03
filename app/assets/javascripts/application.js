// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require handlebars
//= require foundation


  $(document).ready(function(){
  	$('#introbox #play').hide().fadeIn(2000);
  	$('#introbox h2').hide().delay(700).fadeIn(2000);
  }); 

  //Nav bar fade. Disappear by 2nd div.
  $(function(){
    var fadeBegin = 500, 
    fadeFinish = 690, 
    fadingElement = $('.nav');

    $(window).on('scroll', function(){
      var offset = $(document).scrollTop(), opacity = 0; 
      console.log(offset);
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
    