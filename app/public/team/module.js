(function () {
  'use strict';
  angular
    .module('team', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/leagues/:leagueId/teams', {
        templateUrl: '/app/public/team/views/list.html',
        controller: 'TeamsController',
        controllerAs: 'TeamsCtrl'
      })
      .when('/leagues/:leagueId/:teamId', {
         templateUrl: '/app/public/team/views/detail.html',
         controller: 'TeamsController',
         controllerAs: 'TeamsCtrl'
       })
       console.log("I module.js work");
    });
})();
