// // $(document).ready(function () {
// // 	$("#songs-destination").each(function() {

// // 		$.ajax({
// // 			type: 'GET',
// // 			url: 'http://localhost:3000/songs.json', 
// // 			dataType: 'json'
// // 		}).done(function(data) {

// // 			// grab the template we're going to use
	
// // 			var source = $("#songs-template").html();
		

// // 			// compile it with Handlebars

// // 			var template = Handlebars.compile(source);
		

// // 			// displays compiled template with our comic books filled in

// // 			$('#songs-destination').html(template({songs: data}));

// // 		})

// // 	})
// // })

// var songApp = angular.module('song_app', ['ngResource']).config(
//     ['$httpProvider', function($httpProvider) {
//     var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
//     var defaults = $httpProvider.defaults.headers;
//     defaults.common["X-CSRF-TOKEN"] = authToken;
//     defaults.patch = defaults.patch || {};
//     defaults.patch['Content-Type'] = 'application/json';
//     defaults.common['Accept'] = 'application/json';
// }]);

// songApp.factory('Song', ['$resource', function($resource) {
//   console.log($resource('/songs/:id',
//     {id: '@id'},
//     {update: { method: 'PATCH'}}));
//   return $resource('/songs/:id',
//     {id: '@id'},
//     {update: { method: 'PATCH'}});
//     }]);

// songApp.controller('SongCtrl', ['Song', '$scope', function(Song, $scope) {
//     $scope.user_songs = [];
//     console.log($scope.user_songs);
//   	Song.query(function(songs) {
//     $scope.user_songs = songs;
//   });
//     console.log("hi");
//     console.log($scope.user_songs);
// }])