(function() {
  'use strict';
  angular
    .module('team')
    .factory('TeamService', function($http, $rootScope){

      var teamsUrl = "https://fast-eyrie-4476.herokuapp.com/api/leagues/"

      var getTeams = function(league_id) {
        var newTeamsUrl = teamsUrl + league_id + "/teams"
        console.log(newTeamsUrl);
         return $http.get(newTeamsUrl).then(function(teams){
           return teams;
         })
       };

      var getOneTeam = function(teamId, league_id) {
        var teamsUrl = teamsUrl + league_id + "/teams"
        return $http.get(teamsUrl + "/" + teamId).then(function(team){
          console.log("the team", team);
          return team;
        })
      };

       var createTeam = function(team, league_id){
         var newTeamsUrl = teamsUrl + league_id  + "/teams"
         $http.post(newTeamsUrl, team).success(function(response) {
           console.log("RESPONSE: ", response);
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
