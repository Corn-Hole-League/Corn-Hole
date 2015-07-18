(function () {
  'use strict';
  angular
        .module('leagues')
        .directive('leaguesDir', function () {
          return {
            restrict: 'E',
            templateUrl: '/app/public/leagues/views/leaguesDir.directive.html',
            transclude: true,
            scope: {
              l: '=',
              action: '&',
              action2: '&'
            }
          };
        });
})();
