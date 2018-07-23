!function() {
  var app = angular.module('app', []);

  app.directive('myDirective', function (httpPostFactory) {
   return {
       restrict: 'A',
       scope: true,
       link: function (scope, element, attr) {

           element.bind('change', function () {
               var formData = new FormData();
               formData.append('file', element[0].files[0]);
               httpPostFactory('/archive/upload', formData, function (callback) {
                  // recieve image name to use in a ng-src
                   console.log(callback);
                   location.reload()
               });
           });
       }
   };
  });

  app.factory('httpPostFactory', function ($http) {
    return function (file, data, callback) {
        $http({
            url: file,
            method: "POST",
            data: data,
            headers: {'Content-Type': undefined}
        }).then(function (response){
          callback(response);
        });
    };
  });

  app.controller('IndexController', function($scope, $http) {
    $http.get("/archive/my")
    .then(function(response) {
      console.log(response.data);
      $scope.archives = response.data;
    });
  });
}(window);
