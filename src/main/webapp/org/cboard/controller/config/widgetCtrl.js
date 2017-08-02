/**
 * Created by 陶鹏飞 on 2017/8/1.
 */
'use strict';
cBoard.controller('widgetCtrl', function ($scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.optFlag = 'none';
    $scope.curDataset = {data: {expressions: []}};
    $scope.curWidget = {};var translate = $filter('translate');

    var getRoleNameList = function () {
        $http({
            method: 'get',
            url: '/role/roleLoad.do'
        }).success(function (response) {
            $scope.roleNameList = response;
            //console.log($scope.roleNameList.data);
        });
    }
    getRoleNameList();


});