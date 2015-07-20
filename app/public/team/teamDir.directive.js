(function () {
  'use strict';
  angular
        .module('team')
        .directive('teamDir', function () {
          return {
            restrict: 'E',
            templateUrl: '/app/public/team/views/teamDir.directive.htm',
            transclude: true,
            scope: {
              t: '=',
              action: '&',
              action2: '&'
            }
          };
        });
})();
