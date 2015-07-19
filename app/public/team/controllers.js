(function() {
  'use strict';
  angular
    .module('team')
    .controller('TeamsController', function($scope, TeamService, $location, $routeParams){

      TeamService.getTeams($routeParams.leagueId).then(function(teams){
        console.log("Teams data",teams.data);
        $scope.teams = teams.data;
      });

      TeamService.getOneTeam($routeParams.leagueId).then(function(team){
        $scope.team = team.data;
      });

      $scope.createTeam = function(newTeam) {
        TeamService.createTeam(newTeam);
        // $location.path('/leagues');
      };

      $scope.deleteTeam = function(id) {
        console.log("Team ID", id);
        alert('This league has been deleted');
        TeamService.deleteTeam(id);
        // $location.path('/leagues');
      };

      var watchCallback = function () {
        TeamService.getTeams().then(function(teams){
          $scope.teams = teams.data;
        });
      };

      $scope.$on('team:deleted', watchCallback);
      $scope.$on('team:created', watchCallback);
    })

    .controller('CollapseDemoCtrl', function ($scope) {
      $scope.isCollapsed = false;
    });

  })();
