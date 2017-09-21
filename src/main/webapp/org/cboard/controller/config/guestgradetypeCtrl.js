/**
 * Created by 陶鹏飞 on 2017/9/20.
 */
cBoard.controller('guestgradetypeCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');

    ///表格的头部
    $scope.guestgradetypeHeaderInfos = [
        {'name': '档次名称', 'col': 'GuestGradeTypeName'},
        {'name': '档次描述', 'col': 'GuestGradeTypeDesc'},
        {'name': '档次上限', 'col': 'TopAmt'},
        {'name': '档次下限', 'col': 'BottomAmt'},
        {'name': '档次状态', 'col': 'Status'},
        {'name': '创建时间', 'col': 'CreateTime'},
        {'name': '更新时间', 'col': 'UpdateTime'},
        {'name': '操作'}
    ];

    //初始化
    var getGuestGradeTypeList = function () {
        $http({
            method: 'get',
            url: './guestgradetype/getGuestGradeType.do'
            /*params: {
             userName: $scope.userName
             }*/
        }).success(function (response) {
            $scope.guestGradeTypeList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
        });
    };
    getGuestGradeTypeList();
    
    $scope.addGuestGradeType = function () {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/addGuestGradeType.html',
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

    $scope.editGuestGradeType = function () {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/editGuestGradeType.html',
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

    $scope.delGuestGradeType = function () {

    }

});