/**
 * Created by 陶鹏飞 on 2017/8/11.
 */

var regex = /[\u4e00-\u9fa5\u3400-\u4db5\ue000-\uf8ff]/;
cBoard.directive('ifRole', ['$http', function($http) {
    return {
        restrict: "A",
        // scope:true,
        require: 'ngModel',
        link: function(scope, ele, attrs, ngModelController) {
            /*console.log(scope);
            console.log(ele);
            console.log(attrs);
            console.log(ngModelController.$valid);*/
            /*ngModelController.$parsers.unshift(function (newRole) {
                if (regex.test(newRole)) {
                    ngModelController.$setValidity('ifRole', true);
                    return newRole;
                } else {
                    ngModelController.$setValidity('ifRole', false);
                    return newRole;
                }
            });*/
            scope.$watch(attrs.ngModel,function () {
                console.log(scope);
                console.log(ele);
                console.log(attrs);
                console.log(ngModelController);
                scope.inputStatus = ngModelController.$valid;
                console.log("======================================");
                console.log(ngModelController.$valid);
                console.log(attrs.ngModel);
                $http({
                    method: 'get',
                    url: '../role/getRoles.do',
                    params: {
                        roleName: ngModelController.$modelValue
                    }
                }).success(function (response) {
                    console.log("=========================================");
                    console.log(response);
                    if (response.code === 1) {
                        ngModelController.$setValidity('ifRole', false);
                        return newRole;
                    } else if(response.code === 0){
                        ngModelController.$setValidity('ifRole', true);
                        return newRole;
                    }
                })
            })

            /*scope.$watch(attrs.ngModel, function() {
                $http({
                    method: 'POST',
                    url: '/api/check/' + attrs.ensureUnique,
                    data: {'field': attrs.ensureUnique}
                }).success(function(data, status, headers, cfg) {
                    ngModelController.$setValidity('unique', data.isUnique);
                }).error(function(data, status, headers, cfg) {
                    ngModelController.$setValidity('unique', false);
                });
            });*/
        }

    }
}]);


