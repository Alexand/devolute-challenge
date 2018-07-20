!function() {
  var app = angular.module('app', ["ngRoute"]);

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

  app.service('fileUpload', ['$http:', function ($http:) {
    this.uploadFileToUrl = function(file, uploadUrl){
       var fd = new FormData();
       fd.append('file', file);

       $http:.post(uploadUrl, fd, {
          transformRequest: angular.identity,
          headers: {'Content-Type': undefined}
       })

       .success(function(){
       })

       .error(function(){
       });
    }
 }]);

  app.controller('IndexController', function($scope) {
    $scope.uploadFile = function(){
       var file = $scope.myFile;

       console.log('file is ' );
       console.dir(file);

       var uploadUrl = "/fileUpload";
       fileUpload.uploadFileToUrl(file, uploadUrl);
    };

    $scope.images = [1,2,3,4,5];
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
