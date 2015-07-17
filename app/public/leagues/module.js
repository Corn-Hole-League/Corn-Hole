(function () {
  'use strict';
  angular
    .module('leagues', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/leagues', {
        templateUrl: '/app/public/leagues/views/list.html',
        controller: 'LeaguesController',
        controllerAs: 'LeaguesCtrl'
      })
      .when('/leagues/:leagueId', {
         templateUrl: '/app/public/leagues/views/detail.html',
         controller: 'LeaguesController',
         controllerAs: 'LeaguesCtrl'
       })

    });
})();
