!function() {
  var app = angular.module('app', ["ngRoute"]);

  app.controller('IndexController', function($scope) {
    $scope.numbers = [1,2,3,4,5];
  });

  // app.config(function($routeProvider) {
  //     $routeProvider
  //     .when("/", {
  //         templateUrl : "main.html"
  //     })
  //     .when("/red", {
  //         templateUrl : "red.html"
  //     })
  //     .when("/green", {
  //         templateUrl : "green.html"
  //     })
  //     .when("/blue", {
  //         templateUrl : "blue.html"
  //     });
  // });

}(window);
