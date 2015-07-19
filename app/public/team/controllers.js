(function() {
  'use strict';
  angular
    .module('team')
    .controller('TeamsController', function($scope, _, TeamService, $location, $routeParams){

      TeamService.getTeams().then(function(teams){
        console.log("Teams data",teams.data);
        $scope.teams = teams.data;
      });

      TeamService.getOneTeam($routeParams.teamId).then(function(team){
        $scope.team = team.data;
      });

      $scope.createTeam = function(newTeam) {
        TeamService.createTeam(newTeam);
      };

      $scope.deleteTeam = function(id) {
        console.log("Team ID", id);
        alert('This league has been deleted');
        TeamService.deleteTeam(id);
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
