(function() {
  'use strict';
  angular
    .module('team')
    .factory('TeamService', function($http, $rootScope){

      var teamsUrl = "https://fast-eyrie-4476.herokuapp.com/api/leagues/"

      var getTeams = function(league_id) {
        var newTeamsUrl = teamsUrl + league_id + "/teams"
        // var teamsUrl = teamsUrl + league_id + "/teams"
         return $http.get(teamsUrl).then(function(teams){
           return teams;
         })
       };

        var getOneTeam = function(league_id, teamId) {
          var teamsUrl = teamsUrl + league_id + "/teams"
          return $http.get(teamsUrl + "/" + teamId).then(function(team){
            console.log("the team", team);
            return team;
          })
      };

       var createTeam = function(league_id, team){
         var teamsUrl = teamsUrl + league_id + "/teams"
         $http.post(teamsUrl, team).success(function(response) {
           $rootScope.$broadcast('team:created');
         }).error(function(error){
           console.log("error " + error);
         })
       };

       var deleteTeam = function(league_id, id){
         var teamsUrl = teamsUrl + league_id + "/teams"
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
