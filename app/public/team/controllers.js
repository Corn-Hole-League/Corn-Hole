(function() {
  'use strict';
  angular
    .module('team')
    .controller('TeamsController', function($scope, TeamService, $location, $routeParams){

      TeamService.getTeams($routeParams.leagueId).then(function(teams){
        console.log("Teams data",teams.data);
        $scope.teams = teams.data;
        console.log("I get Teams and live in controller.js");
      });

      TeamService.getOneTeam($routeParams.teamId, $routeParams.leagueId).then(function(team){
        $scope.team = team.data;
        console.log("I get one team and live in controller.js", team.data);
      });

      $scope.createTeam = function(newTeam) {
        TeamService.createTeam(newTeam, $routeParams.leagueId);
      };

      $scope.deleteTeam = function(id) {
        console.log("Team ID", id);
        alert('This team has been deleted from controller.js');
        TeamService.deleteTeam(id);
        // $location.path('/leagues');
      };

      var watchCallback = function () {
        TeamService.getTeams($routeParams.leagueId).then(function(teams){
          $scope.teams = teams.data;
        });
      };

      $scope.$on('team:deleted', watchCallback);
      console.log("team data deleted");
      $scope.$on('team:created', watchCallback);
      console.log("team data created");
    })

    //  .controller('CollapseDemoCtrl', function ($scope) {
    //    $scope.isCollapsed = false;
    //  });

  })();
