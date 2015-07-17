(function () {
  'use strict';
  angular
    .module('leagues')
    .factory('LeagueService', function ($http, $rootScope) {

     var cornHoleUrl = " http://corn-hole.herokuapp.com/"

     var getLeagues = function() {
        return $http.get(cornHoleUrl).then(function(leagues){
          return leagues;
        })
      };

      var getOneLeague = function (leagueId) {
        console.log("LEAGUE:", leagueId);
        return $http.get(cornHoleUrl + "/" + leagueId).then(function(league){
          return league;
        })
    };

      var createLeague = function(league){
        $http.post(cornHoleUrl, league).success(function(response) {
          $rootScope.$broadcast('league:created');
        }).error(function(error){
          console.log("error " + error);
        })
      };

      var deleteLeague = function(id){
        $http.delete(cornHoleUrl + "/" + id).success(function(response) {
          $rootScope.$broadcast('league:deleted');
        }).error(function(error){
          console.log("error " + error);
        })
      }

      return{
        getLeagues: getLeagues,
        getOneLeague: getOneLeague,
        createLeague: createLeague,
        deleteLeague: deleteLeague
      };
    });

})();
