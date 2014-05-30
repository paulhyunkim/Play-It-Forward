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
//= require foundation
//= require bootstrap
//= require_tree .

$(document).ready(function(){

	$('#introbox h1').hide().fadeIn(2000);
	$('#introbox h2').hide().delay(700).fadeIn(2000);
// ----------------------------------------------------

}); //closes document.ready
$(function(){ $(document).foundation(); });









	// $("#lorem1").mouseover(function(){
 // 	 $(this).filter(':not(:animated)').fadeTo(400,0);
 // 	  $('#testing').fadeTo(400,1);
 // 	});	
	// $("#lorem1").mouseout(function(){
	// 	$(this).fadeTo(400,1);
	// 	 $('#testing').fadeTo(400,0);
	// }); 

	// $("#lorem2").mouseover(function(){
 // 	 $("#lorem2").fadeTo(400,0);
 // 	});	
	// $("#lorem2").mouseout(function(){
	// 	$("#lorem2").fadeTo(400,1);
 // 		 $("#lorem2").html("A small group of web developers, aiming to BREAK FACEBOOK");
	// }); 

	// $("#lorem3").mouseover(function(){
 // 	 $("#lorem3").fadeTo(400,0);

 // 	});	
	// $("#lorem3").mouseout(function(){
	// 	$("#lorem3").fadeTo(400,1);
 // 		 $("#lorem3").html("Connect with us here!");
	// }); 

