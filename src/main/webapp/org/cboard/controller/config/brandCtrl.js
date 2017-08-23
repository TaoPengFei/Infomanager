/**
 * Created by 陶鹏飞 on 2017/8/21.
 */
cBoard.controller('brandCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.optFlag = 'none';
    // $scope.curBrand = '';


    $scope.newDs = function () {
        $scope.optFlag = 'addBrand';
        console.log('addBrand...');
    };
    $scope.editDs = function () {
        $scope.optFlag = 'editBrand';
        console.log('editBrand...');
    };

    /*$scope.$watch($scope.optFlag, function () {
        console.log("+++++++++++++++++++++++++++++++++")
        console.log($scope.optFlag);
    })*/

});