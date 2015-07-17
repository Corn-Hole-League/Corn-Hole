(function() {
  'use strict';
  angular
    .module('team')
    .factory('TeamService', function($http, $rootScope){
      //uncomment with the corn-hole/teamUrl ...when we get it
      // var teamUrl = "http://tiy-fee-rest.herokuapp.com/collections/mitch-etsy_store";


       var getTeams = function(){
         return $http.get(teamUrl).then(function(items){
           var cartArray = items.data;
           return cartArray;
         })
       };

       var addToTeams = function(item){
         $http.post(teamUrl, item).success(function(response){
           $rootScope.$broadcast('item:created');
         }).error(function(error){
         })
       }

       var removeFromTeams = function(id){
         $http.delete(teamUrl + "/" + id).success(function(response){
           $rootScope.$broadcast('item:deleted');
         }).error(function(error){
         })
       }

       return{
         getTeams: getTeams,
         addToTeams: addToTeams,
         removeFromTeams: removeFromTeams
       };
     });

})();
