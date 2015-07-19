(function () {
  'use strict';
  angular
        .module('competitions')
        .directive('compsDir', function () {
          return {
            restrict: 'E',
            templateUrl: '/app/public/competitions/views/compsDir.directive.html',
            transclude: true,
            scope: {
              c: '=',
              action: '&',
              action2: '&'
            }
          };
        });
})();
