/**
 * Created by 陶鹏飞 on 2017/8/26.
 */
/**
 * Created by 陶鹏飞 on 2017/8/25.
 */
cBoard.controller('roleMenuTreeCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.selectedRoleName = '';
    $scope.selectedMenuWithoutRole = '';
    $scope.selectedMenuWithRole = '';

    //用户角色载入
    var getRoleNameList = function () {
        $http({
            method: 'get',
            url: '/role/roleLoad.do'
        }).success(function (response) {
            $scope.roleNameList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
        });
    }
    getRoleNameList();

    $scope.withMenuEdit = function () {
        console.log("withMenuEdit...");
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/modifyMenu.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                /*$http({
                 method: 'get',
                 url: '../role/roleLoad.do'
                 }).success(function (response) {
                 $scope.roleList_1 = response;
                 console, log($scope.roleList_1);
                 }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                 ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                 });*/
                // console.log($uibModalInstance)
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    console.log("OK...");
                    $uibModalInstance.close();
                }
            }
        });
    };

    $scope.withoutMenuEdit = function () {
        console.log("withoutMenuEdit...");
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/modifyMenu.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                /*$http({
                    method: 'get',
                    url: '../role/roleLoad.do'
                }).success(function (response) {
                    $scope.roleList_1 = response;
                    console, log($scope.roleList_1);
                }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                    ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                });*/
                // console.log($uibModalInstance)
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    console.log("OK...");
                    $uibModalInstance.close();
                }
            }
        });
    }

});