(function () {
  'use strict';
  angular
        .module('team')
        .directive('teamDir', function () {
          return {
            restrict: 'E',
            templateUrl: 'app/team/views/teamDir.directive.html',
            transclude: true,
            scope: {
              l: '=',
              action: '&',
              action2: '&'
            }
          };
        });
})();
