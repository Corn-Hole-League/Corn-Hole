(function () {
  'use strict';
  angular
    .module('competitions')
    .factory('CompetitionService', function ($http, $rootScope) {

     var competitionUrl = "https://fast-eyrie-4476.herokuapp.com/api/events"

     var getComps = function() {
        return $http.get(competitionUrl).then(function(comps){
          return comps;
        })
      };

      var getOneComp = function(compId) {
        return $http.get(competitionUrl + "/" + compId).then(function(comp){
          console.log("the comp", comp);
          return comp;
        })
    };

      var createComp = function(comp){
        $http.post(competitionUrl, comp).success(function(response) {
          $rootScope.$broadcast('comp:created');
        }).error(function(error){
          console.log("error " + error);
        })
      };

      var deleteComp = function(id){
        $http.delete(competitionUrl + "/" + id).success(function(response) {
          $rootScope.$broadcast('comp:deleted');
        }).error(function(error){
          console.log("error " + error);
        })
      }

      return{
        getComps: getComps,
        getOneComp: getOneComp,
        createComp: createComp,
        deleteComp: deleteComp
      };
    });

})();
