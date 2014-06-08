var userLat = null;
var userLng = null;
var playlistSongs = [];
var currentSong = null;


// set user coordinates upon page load
navigator.geolocation.getCurrentPosition(function(position) { 
    userLat = position.coords.latitude;
    userLng = position.coords.longitude; 
    console.log(userLat);
    console.log(userLng);
  });

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
// added the reverse Geocode directive for Angular
userApp.directive('reverseGeocode', function () {
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
// end of geocode

userApp.factory('UserSong', ['$resource', function($resource) {
  return $resource('/usersongs/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

userApp.factory('SearchSong', ['$resource', function($resource) {
  return $resource('/searchsongs/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

userApp.factory('PlaylistSong', ['$resource', function($resource) {
  return $resource('/playlistsongs/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

userApp.factory('CurrentUser', ['$resource', function($resource) {
  return $resource('/currentusers',
    { },
    { 'update': { method: 'PUT'}});
    }]);



userApp.controller('UserCtrl', ['UserSong', 'SearchSong', 'PlaylistSong', 'CurrentUser', '$scope', function(UserSong, SearchSong, PlaylistSong, CurrentUser, $scope) {

    // load user's songs on page upon load
    $scope.userSongs = [];
    $scope.alerts = [];
    $scope.isSongSearched = false;
    $scope.playState = playOrPaused;

  	UserSong.query(function(songs) {
      $scope.userSongs = songs;
      console.log($scope.userSongs);
    });
    $scope.newUserSong = new UserSong();

    // load playlist songs on page upon load
    $scope.playlistSongs = [];
    PlaylistSong.query(function(songs) {
      $scope.playlistSongs = songs;
      playlistSongs = songs;
    
      
    });
    $scope.newPlaylistSong = new PlaylistSong();

    // initialize searchSongs as empty list
    $scope.searchSongs = [];




    // only search when search button is clicked
    $scope.search = function(searchTerm) {
      SearchSong.query({ search: searchTerm }, function(songs) {
        $scope.searchSongs = songs;
        console.log($scope.searchSongs);
        $scope.isSongSearched = true;
      });
    }
    $scope.newSearchSong = new SearchSong();  

    $scope.updateUserLocation = function () {
      var curUser = CurrentUser.get(function(user) {
        user.lat = userLat;
        user.lng = userLng;
       
        console.log("attempting to update");
        // CurrentUser.update({}, curUser);
        curUser.$update();
        console.log("after attempt");
        console.log(userLat);
        console.log(userLng);
        console.log("inside");
        console.log(curUser);
      });

      console.log("outside");
      console.log(curUser);
    }


    $scope.addAlert = function() {
      $scope.alerts.push({msg: "Song was Added!!"});
      // setInterval(function(){
      // document.getElementsByClassName('.bodybox').style.backg
      // },3000);
    };

    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };

    $scope.playSong = function(song) {
      apiswf.rdio_play(song.key);
      currentSong = song;
      console.log(currentSong);
    }

    $scope.saveSong = function (song) {
      console.log("attempting to save song");
      $scope.newUserSong = new UserSong({
        key: song.key,
        artist: song.artist,
        title: song.name,
        album: song.album,
        duration: song.duration,
        is_explicit: song.isExplicit,
        image_url: song.icon400
      });
      console.log($scope.newUserSong);
      
      $scope.newUserSong.$save(function(song) {
        $scope.userSongs.push(song);
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


    $scope.checkPlayState = function() {
      $scope.playState = playOrPaused;
      console.log($scope.playState);
    }





}]);



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

