var userLat = null;
var userLng = null;
var playlistSongs = [];
var currentSong = null;


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
  return $resource('/searchsongs',
    { },
    {update: { method: 'PATCH'}});
    }]);

userApp.factory('PlaylistSong', ['$resource', function($resource) {
  return $resource('/playlistsongs/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
    }]);

// https://maps.googleapis.com/maps/api/geocode/json?latlng=34.0610788,-118.44307019999998&key=AIzaSyCqXUnMxdZec-6WHjEaOxXrnp1NbR-eszs


userApp.factory('CurrentUser', ['$resource', function($resource) {
  return $resource('/currentusers',
    { },
    { 'update': { method: 'PUT'}});
    }]);


userApp.controller('UserCtrl', ['UserSong', 'SearchSong', 'PlaylistSong', 'CurrentUser', '$scope', '$timeout', function(UserSong, SearchSong, PlaylistSong, CurrentUser, $scope, $timeout) {

    // load user's songs on page upon load
    $scope.userSongs = [];
    $scope.alerts = [];
    $scope.isSongSearched = false;
    $scope.playState = playOrPaused;
    $scope.map = {
        center: {
            latitude: userLng,
            longitude: userLat
        },
        zoom: 8
    };

    // set user coordinates upon page load
    navigator.geolocation.getCurrentPosition(function(position) { 
      userLat = position.coords.latitude;
      userLng = position.coords.longitude; 
      var curUser = CurrentUser.get(function(user) {
        

        var geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(userLat, userLng);
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    user.lat = userLat;
                    user.lng = userLng;
                    user.coordinates = "POINT(" + userLng + " " + userLat + ")";
                    user.city = results[0].address_components[2].long_name;
                    user.state = results[0].address_components[4].long_name;
                    console.log(results);
                    curUser.$update();
                    console.log(curUser);
                    console.log("User location updated. Latitude: " + userLat + " Longitude: " + userLng);
                } else {
                    element.text('Location not found');
                }
            } else {
                element.text('Geocoder failed due to: ' + status);
            }
        });


        
      });
    });
    

    UserSong.query(function(songs) {
      $scope.userSongs = songs;
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

    $scope.updateUserLocation = function() {
      var curUser = CurrentUser.get(function(user) {
        user.lat = userLat;
        user.lng = userLng;
        curUser.$update();
      });
    }

    $scope.updateSongLocation = function() {
      $scope.lat = userLat;
      $scope.lng = userLng;
      $scope.refresh = true;
    }

    $scope.addAlert = function(index) {
      $scope.alerts.push({msg: "Song was Added!!"});
      $timeout(function(){
        $scope.alerts.splice(index, 1);
      },1500)
    }

    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    }

    $scope.playSong = function(song) {
      playlist[4] = song;
      console.log("playing: " + song.title);
      apiswf.rdio_play(song.key);
      queueRandomSong();
      console.log(playlist);
      // callback_object.repeatChanged();
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

      console.log("before delete");

      position = $scope.searchSongs.indexOf(song);
      $scope.searchSongs.splice(position, 1);

    }

    $scope.likeSong = function () {
      console.log(currentSong);
      $scope.newUserSong = new UserSong({
        key: currentSong.key,
        artist: currentSong.artist,
        title: currentSong.title,
        album: currentSong.album,
        duration: currentSong.duration,
        is_explicit: currentSong.is_explicit,
        image_url: currentSong.image_url
      });
      console.log($scope.newUserSong);
      
      $scope.newUserSong.$save(function(song) {
        $scope.userSongs.push(song);
        $scope.newUserSong = new UserSong();
      });
    }

    $scope.deleteSong = function (song) {
      song.$delete(function() {
        position = $scope.userSongs.indexOf(song);
        $scope.userSongs.splice(position, 1);
        console.log("delete");
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