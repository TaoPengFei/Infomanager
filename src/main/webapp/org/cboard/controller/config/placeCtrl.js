/**
 * Created by 陶鹏飞 on 2017/9/20.
 */
cBoard.controller('placeCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');

    ///表格的头部
    $scope.placeHeaderInfos = [
        {'name': '编码', 'col': 'PlaceCode'},
        {'name': '名称', 'col': 'PlaceName'},
        {'name': '描述', 'col': 'PlaceDesc'},
        {'name': '序列', 'col': 'PlaceSeq'},
        {'name': '状态', 'col': 'Status'},
        {'name': '创建时间', 'col': 'CreateTime'},
        {'name': '更新时间', 'col': 'UpdateTime'},
        {'name': '操作'}
    ];

    //初始化
    var getPlaceList = function () {
        $http({
            method: 'get',
            url: './place/getPlace.do'
            /*params: {
                userName: $scope.userName
            }*/
        }).success(function (response) {
            $scope.placeList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
        });
    };
    getPlaceList();
    
    $scope.addPlace = function () {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/addPlace.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                /*$http({
                 method: 'get',
                 url: './role/roleLoad.do'
                 }).success(function (response) {
                 $scope.roleList_1 = response;
                 console,log($scope.roleList_1);
                 }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                 ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                 });*/
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    /*$http({
                     method: 'POST',
                     url: './user/addUser.do',
                     data:{
                     name: $scope.newUserName,
                     role: $scope.newUserRole,
                     password: $scope.newUserPwd,
                     // oldRole:oldRole,
                     desc: $scope.newUserDesc
                     }
                     }).success(function (response) {
                     if (response.code === 0) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                     } else if (response.code === 1) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
                     } else if (response.code === -2) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                     }
                     getUserList();
                     }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                     ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                     });*/
                    $uibModalInstance.close();
                }
            }
        });
    };

    $scope.editPlace = function (cuttent, $event) {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/editPlace.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                /*$http({
                 method: 'get',
                 url: './role/roleLoad.do'
                 }).success(function (response) {
                 $scope.roleList_1 = response;
                 console,log($scope.roleList_1);
                 }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                 ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                 });*/
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    /*$http({
                     method: 'POST',
                     url: './user/addUser.do',
                     data:{
                     name: $scope.newUserName,
                     role: $scope.newUserRole,
                     password: $scope.newUserPwd,
                     // oldRole:oldRole,
                     desc: $scope.newUserDesc
                     }
                     }).success(function (response) {
                     if (response.code === 0) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                     } else if (response.code === 1) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
                     } else if (response.code === -2) {
                     ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                     }
                     getUserList();
                     }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                     ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                     });*/
                    $uibModalInstance.close();
                }
            }
        });
    }

    $scope.delPlace = function (cuttent, $event) {

    }

});