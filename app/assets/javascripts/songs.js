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