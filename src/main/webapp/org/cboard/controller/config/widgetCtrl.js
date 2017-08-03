/**
 * Created by 陶鹏飞 on 2017/8/1.
 */
'use strict';
cBoard.controller('widgetCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.optFlag = 'none';
    $scope.curDataset = {data: {expressions: []}};
    $scope.curWidget = {};var translate = $filter('translate');
    $scope.selectedRoleName = '';

    var getRoleNameList = function () {
        $http({
            method: 'get',
            url: '/role/roleLoad.do'
        }).success(function (response) {
            $scope.roleNameList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        });
    }
    getRoleNameList();

    $scope.$watch("selectedRoleName",function () {
        console.log($scope.selectedRoleName);
    })




});