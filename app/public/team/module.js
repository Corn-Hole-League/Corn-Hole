(function () {
  'use strict';
  angular
    .module('team', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/team', {
        templateUrl: '/app/public/team/views/list.html',
        controller: 'TeamsController',
        controllerAs: 'TeamsCtrl'
      })
      .when('/team/:teamId', {
         templateUrl: '/app/public/team/views/detail.html',
         controller: 'TeamsController'
       })

    });
})();
