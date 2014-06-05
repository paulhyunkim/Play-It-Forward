var userApp = angular.module('user_app', ['ngResource', 'mm.foundation']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;
    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';

}]);


// CITY name generator
userApp.directive('reverseGeocode', function () {
        console.log('reverseGeocode');
        return {
            restrict: 'E',
            template: '<div></div>',
            link: function (scope, element, attrs) {
                var geocoder = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng(attrs.lat, attrs.lng);
                geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[1]) {
                            element.text(results[0].address_components[2].long_name);
                        } else {
                            element.text('Location not found');
                        }
                    } else {
                        element.text('Geocoder failed due to: ' + status);
                    }
                });
            },
            replace: true
        }
    });
//END OF CITY generator

userApp.factory('UserSong', ['$resource', function($resource) {
  console.log("in the factory");
  return $resource('/songs/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

userApp.factory('SearchSong', ['$resource', function($resource) {
  console.log("in the factory");
  return $resource('/users/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

userApp.controller('UserCtrl', ['UserSong', 'SearchSong', '$scope', function(UserSong, SearchSong, $scope) {

    // load user's songs on page upon load
    $scope.userSongs = [];
    $scope.alerts = [
  ];

  	UserSong.query(function(songs) {
      $scope.userSongs = songs;
      console.log($scope.userSongs);
    });
    $scope.newUserSong = new UserSong();

    // initialize searchSongs as empty list
    $scope.searchSongs = [];

    // only search when search button is clicked
    $scope.search = function(searchTerm) {
      SearchSong.query({search: searchTerm }, function(songs) {
        $scope.searchSongs = songs;
        console.log($scope.searchSongs);
      });
    }
    $scope.newSearchSong = new SearchSong();


    $scope.playSong = function(key) {
      apiswf.rdio_play(key);
    }

    // TRYING TO SAVE API GENERATED JSON TO DB
    $scope.saveSong = function (song) {
      $scope.newUserSong = new UserSong({
        key: song.key,
        artist: song.artist,
        title: song.name,
        album: song.album,
        duration: song.duration,
        is_explicit: song.isExplicit,
        image_url: song.icon400
      });
      console.log($scope.newUserSong)
      
      $scope.newUserSong.$save(function(song) {
        $scope.userSongs.push(song)
        $scope.newUserSong = new UserSong();
      });
    }

    $scope.deleteSong = function (song) {
      song.$delete(function() {
        position = $scope.songs.indexOf(song);
        $scope.songs.splice(position, 1);
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

}])



// userApp.factory('All', ['$resource', function($resource) {
//   return $resource('/songs/all/:id',
//     {id: '@id'},
//     {update: { method: 'PATCH'}});
//     }]);

// userApp.controller('UserAllCtrl', ['All', '$scope', function(All, $scope) {
//     $scope.all_songs = [];
   
//     User.query(function(songs) {
//     $scope.all_songs = songs;
//   });
   
// }])


$(document).ready(function(){
    apiswf.rdio_play($('#play_key').val());
  });
