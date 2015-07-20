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

      TeamService.getOneTeam($routeParams.leagueId).then(function(team){
        $scope.team = team.data;
        console.log("I get one team and live in controller.js");
      });

      $scope.createTeam = function($routeParams.leagueId, newTeam) {
        TeamService.createTeam(newTeam);
        console.log("I create teams and live in the controller.js");
        // $location.path('/leagues');
      };

      $scope.deleteTeam = function($routeParams.leagueId, id) {
        console.log("Team ID", id);
        alert('This team has been deleted from controller.js');
        TeamService.deleteTeam(id);
        // $location.path('/leagues');
      };

      var watchCallback = function () {
        TeamService.getTeams().then(function(teams){
          $scope.teams = teams.data;
        });
      };

      $scope.$on('team:deleted', watchCallback);
      console.log("team data deleted");
      $scope.$on('team:created', watchCallback);
      console.log("team data created");
    })

    // .controller('CollapseDemoCtrl', function ($scope) {
    //   $scope.isCollapsed = false;
    // });

  })();
