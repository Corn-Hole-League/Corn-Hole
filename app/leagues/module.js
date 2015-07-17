(function () {
  'use strict';
  angular
    .module('leagues', [
      'ngRoute',
    ])
    .config(function ($routeProvider) {
      $routeProvider
      .when('/leagues', {
        templateUrl: 'app/leagues/views/list.html',
        controller: 'LeaguesController'
      })
        .when('/leagues/:leagueId', {
          templateURL: 'app/leagues/views/detail.html',
          controller: 'LeaguesController'
        })
        .otherwise({
          redirectTo: '/404'
        });
    });
})();
