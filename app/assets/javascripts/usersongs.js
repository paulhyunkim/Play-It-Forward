$(document).ready(function () {
	$("#songs-destination").each(function() {

		$.ajax({
			type: 'GET',
			url: 'http://localhost:3000/songs.json', 
			dataType: 'json'
		}).done(function(data) {

			// grab the template we're going to use
	
			var source = $("#songs-template").html();
		

			// compile it with Handlebars

			var template = Handlebars.compile(source);
		

			// displays compiled template with our comic books filled in

			$('#songs-destination').html(template({songs: data}));

		})

	})
})