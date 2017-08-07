/**
 * Created by 陶鹏飞 on 2017/8/4.
 */
cBoard.controller('userCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.optFlag = 'none';
    $scope.dsView = '';
    $scope.curDatasource = {};
    $scope.userName = "";

    var getUserList = function () {
        $http({
            method: 'get',
            url: '/user/queryUser.do',
            params :{
                userName:$scope.userName
            }
        }).success(function (response) {
            $scope.userList = response;
            /*
             //淘汰/启用样式控制
             $scope.setStyle = function () {
             //TODO
             }
             */
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        });
    };
    getUserList();

    var getRoleList = function () {
        $http({
            method: 'get',
            url: '/role/roleLoad.do'
        }).success(function (response) {
            $scope.roleList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        });
    }

    //查询用户
    /*
     $scope.queryUser = function (current,$event) {
     console.log("查询用户...");
     };
     */
    //数据双向绑定+监听机制
    $scope.$watch("userName",function () {
        $http({
            method:'post',
            url:'/user/queryUser.do',
            data :{
                userName:$scope.userName
            }
        }).success(function (response) {
            $scope.userList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        })
    })

    //增加用户
    $scope.addUser = function (current,$event) {
        console.log("增加用户...");
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/addUser.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                getRoleList();
                console.log($uibModalInstance)
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    console.log("保存用户...");
                }
            }
        });
    };

    //删除用户
    $scope.delUser = function (current,$event) {
        console.log("删除用户...");
    };

    //修改用户
    $scope.modifyUser = function (current,$event) {
        console.log("修改用户...");
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/modifyUser.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                //getRoleList();
                console.log($uibModalInstance)
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    console.log("保存修改...");
                }
            }
        });
    };

    //启动/淘汰用户
    $scope.enableUser = function (current,$event) {
        $http({
            method: 'post',
            url: '/user/updateUser.do',
            data :{
                name:current.userName,
                enabled:!current.enabled
            }
        }).success(function (response) {
            if(response.code === 1){
                ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
            }else if(response.code === 0){
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }else if(response.code === -1){
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }else if(response.code === -2){
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }
            getUserList();
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        });
        $event.stopPropagation();//阻止冒泡
    };
});