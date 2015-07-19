(function () {
  'use strict';
  angular
    .module('competitions')
    .controller('CompController', function($scope, CompetitionService, $location, $routeParams){

      CompetitionService.getComps().then(function(comps){
        console.log("Comps data",comps.data);
        $scope.comps = comps.data;
      });

      CompetitionService.getOneComp($routeParams.compId).then(function(comp){
        $scope.comp = comp.data;
      });

      $scope.createComp = function(newComp) {
        CompetitionService.createComp(newComp);
        $location.path('/events');
      };

      $scope.deleteComp = function(id) {
        console.log("Comp ID", id);
        alert('This competition has been deleted');
        CompetitionService.deleteComp(id);
        $location.path('/events');
      };

      var watchCallback = function () {
        CompetitionService.getComps().then(function(comps){
          $scope.comps = comps.data;
        });
      };

      $scope.$on('comp:deleted', watchCallback);
      $scope.$on('comp:created', watchCallback);
    })

    .controller('CollapseDemoCtrl', function ($scope) {
      $scope.isCollapsed = false;
    });

})();
