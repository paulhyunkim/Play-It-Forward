$(document).ready(function () {
	$("#songs-destination").each(function() {

		$.ajax({
			type: 'GET',
			url: 'http://localhost:3000/songs.json', 
			dataType: 'json'
		}).done(function(data) {

			// grab the template we're going to use
			console.log(data)
			var source = $("#songs-template").html();
			console.log(data);

			// compile it with Handlebars

			var template = Handlebars.compile(source);
			console.log(source);

			// displays compiled template with our comic books filled in

			$('#songs-destination').html(template({songs: data}));

		})

	})
})

