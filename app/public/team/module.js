(function () {
  'use strict';
  angular
    .module('team', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/leagues/:league:Id/teams', {
        templateUrl: '/app/public/team/views/list.html',
        controller: 'TeamsController',
        controllerAs: 'TeamsCtrl'
        console.log("I'm the 1st routeProvider working");
      })
      .when('/leagues/:leagueId/:teamId', {
         templateUrl: '/app/public/team/views/detail.html',
         controller: 'TeamsController',
         controllerAs: 'TeamsCtrl'
         console.log("I'm the 2nd routeProvider working");
       })
       console.log("I module.js work");
    });
})();
