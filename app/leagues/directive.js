(function () {
  'use strict';
  angular
        .module('leagues')
        .directive('leagues', function () {
          return {
            restrict: 'E',
            templateUrl: 'app/leagues/views/leagues.directive.html',
            transclude: true,
            scope: {
              p: '=',
              action: '&'
            }
          };

        });

})();
