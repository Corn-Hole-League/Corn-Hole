(function () {
  'use strict';
  angular
    .module('team', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/team', {
<<<<<<< HEAD
        templateUrl: 'app/public/team/views/list.html',
=======
        templateUrl: '/app/public/team/views/list.html',
>>>>>>> f460785f6e1d44197996695ff68e7ce4fc050fc4
        controller: 'TeamsController',
        controllerAs: 'TeamsCtrl'
      })
      .when('/team/:teamId', {
<<<<<<< HEAD
         templateUrl: 'app/public/team/views/detail.html',
=======
         templateUrl: '/app/public/team/views/detail.html',
>>>>>>> f460785f6e1d44197996695ff68e7ce4fc050fc4
         controller: 'TeamsController'
       })

    });
})();
