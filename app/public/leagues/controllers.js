(function () {
  'use strict';
  angular
    .module('leagues')
    .controller('LeaguesController', function($scope, LeagueService, $location, $routeParams){

      LeagueService.getLeagues().then(function(leagues){
        console.log("Leagues data",leagues.data);
        $scope.leagues = leagues.data;
      });

      LeagueService.getOneLeague($routeParams.leagueId).then(function(league){
        $scope.league = league.data;
      });

      $scope.createLeague = function(newLeague) {
        LeagueService.createLeague(newLeague);
        $location.path('/leagues');
      };

      $scope.deleteLeague = function(id) {
        console.log("LEAGUE ID", id);
        alert('This league has been deleted');
        LeagueService.deleteLeague(id);
        $location.path('/leagues');
      };

      var watchCallback = function () {
        LeagueService.getLeagues().then(function(leagues){
          $scope.leagues = leagues.data;
        });
      };

      $scope.$on('league:deleted', watchCallback);
      $scope.$on('league:created', watchCallback);
    })

    .controller('CollapseDemoCtrl', function ($scope) {
      $scope.isCollapsed = false;
    });

})();
