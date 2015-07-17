(function () {
  'use strict';
  angular
    .module('leagues')
    .factory('LeagueService', function ($http, $rootScope, $q, $cacheFactory) {

     var cacheCreator = $cacheFactory('CacheCreator');
     var cornHoleUrl = "http://tiy-fee-rest.herokuapp.com/collections/apptesting"

     var getLeagues = function() {
        return $http.get(cornHoleUrl).then(function(leagues){
          return leagues;
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
      createLeague: createLeague,
      deleteLeague: deleteLeague
    };
  });

})();
