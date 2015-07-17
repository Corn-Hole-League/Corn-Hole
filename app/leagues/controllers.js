(function () {
  'use strict';
  angular
    .module('leagues')
    .controller('LeaguesController', function($scope, LeagueService, $location) {

      $scope.league = {};

      LeagueService.getLeagues().then(function(leagues){
        $scope.leagues = leagues.data;
      });

      $scope.createLeague = function(newLeague) {
        LeagueService.createLeague(newLeague);
        $location.path('/leagues');
      };

      $scope.deleteLeague = function(id) {
        LeagueService.deleteLeague(id);
      };

      var watchCallback = function () {
        LeagueService.getLeagues().then(function(leagues){
          $scope.leagues = leagues;
        });
      };

      $scope.$on('league:deleted', watchCallback);
      $scope.$on('league:created', watchCallback);
    });


})();
