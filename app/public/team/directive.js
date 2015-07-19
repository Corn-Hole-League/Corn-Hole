(function () {
  'use strict';
  angular
        .module('team')
        .directive('teamDir', function () {
          return {
            restrict: 'E',
<<<<<<< HEAD
            templateUrl: 'app/public/team/views/teamDir.directive.html',
=======
            templateUrl: '/app/public/team/views/teamDir.directive.html',
>>>>>>> f460785f6e1d44197996695ff68e7ce4fc050fc4
            transclude: true,
            scope: {
              t: '=',
              action: '&',
              action2: '&'
            }
          };
        });
})();
