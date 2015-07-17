(function() {
  'use strict';
  angular
    .module('team', [
      'ngRoute'
    ])
    .config(function($routeProvider){
      $routeProvider
        .when('/teams', {
          templateUrl: 'team/views/list.html',
          controller: 'controllers'
        })
    })

})();
