(function () {
  'use strict';
  angular
    .module('team', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/team', {
        templateUrl: 'team/views/list.html',
        controller: 'TeamsController',
        controllerAs: 'TeamsCtrl'
      })
      .when('/team/:teamId', {
         templateUrl: 'team/views/detail.html',
         controller: 'TeamsController'
       })

    });
})();
