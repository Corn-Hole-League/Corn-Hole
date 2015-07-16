(function() {
  'use strict';
  angular
    .module('team')
    .controller('TeamsController', function($scope, _, TeamService, $location){

        TeamService.getTeams().then(function(items){
          $scope.items = items;
        })

      $scope.addToTeams = function(item){
        TeamsService.addToCart(item);
      }

      $scope.removeFromTeams = function(id){
        TeamsService.removeFromTeams(id);
      }

      var watchCallback = function () {
          TeamsService.getTeams().then(function (items) {
            $scope.items = items;
          });
        };

      $scope.$on('item:deleted', watchCallback);
      $scope.$on('item:created', watchCallback);
    });

})();
