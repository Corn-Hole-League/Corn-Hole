(function() {
  'use strict';
  angular
    .module('team')
    .factory('TeamService', function($http, $rootScope){

      var teamsUrl = "https://fast-eyrie-4476.herokuapp.com/api/leagues/teams"

      var getTeams = function() {
         return $http.get(teamsUrl).then(function(teams){
           return teams;
         })
       };

       var getOneTeam = function(teamId) {
         return $http.get(teamsUrl + "/" + teamId).then(function(team){
           console.log("the team", team);
           return team;
         })
     };

       var createTeam = function(team){
         $http.post(teamsUrl, team).success(function(response) {
           $rootScope.$broadcast('team:created');
         }).error(function(error){
           console.log("error " + error);
         })
       };

       var deleteTeam = function(id){
         $http.delete(teamsUrl + "/" + id).success(function(response) {
           $rootScope.$broadcast('team:deleted');
         }).error(function(error){
           console.log("error " + error);
         })
       }

       return{
         getTeams: getTeams,
         getOneTeam: getOneTeam,
         createTeam: createTeam,
         deleteTeam: deleteTeam
       };
     });

  })();
