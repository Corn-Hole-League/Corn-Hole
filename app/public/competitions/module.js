(function () {
  'use strict';
  angular
    .module('competitions', [
      'ngRoute',
    ])
    .config(function ($routeProvider){
      $routeProvider
      .when('/events', {
        templateUrl: '/app/public/competitions/views/list.html',
        controller: 'CompController',
        controllerAs: 'CompCtrl'
      })
      .when('/events/:compId', {
         templateUrl: '/app/public/competitions/views/detail.html',
         controller: 'CompController',
         controllerAs: 'CompCtrl'
       })

    });
})();
