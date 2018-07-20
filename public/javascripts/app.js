!function() {
  var app = angular.module('app', []);

  app.directive('fileModel', ['$parse', function ($parse) {
      return {
         restrict: 'A',
         link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
               scope.$apply(function(){
                  modelSetter(scope, element[0].files[0]);
               });
            });
         }
      };
  }]);

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

  app.controller('IndexController', function($scope) {
    $scope.images = [1,2,3,4,5];
  });
}(window);
