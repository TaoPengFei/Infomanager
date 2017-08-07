/**
 * Created by 陶鹏飞 on 2017/8/2.
 */
cBoard.controller('datasetCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');
    $scope.optFlag = 'none';
    $scope.curDataset = {data: {expressions: []}};
    $scope.curWidget = {};
    $scope.roleName = "";
    $scope.newRole = "";
    $scope.newDesc = "";
    $scope.count = 0;//已选择数量
    $scope.selectData = [];//已选对象

    var getRolesList = function () {
        $http({
            method: 'get',
            url: '/role/getRoles.do',
            params :{
                roleName:$scope.roleName
            }
        }).success(function (response) {
            $scope.roleList = response;
        });
    }
    getRolesList();

    //数据双向绑定+监听机制
    $scope.$watch("roleName",function () {
        $http({
            method:'post',
            url:'/role/getRoles.do',
            data :{
                roleName:$scope.roleName
            }
        }).success(function (response) {
            if(response.code === 0){
                //ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }else if(response.code === 1){
                //ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
            }else if(response.code === -1){
                //ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }
            $scope.roleList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        });
    })

    //查询
    /*
    $scope.queryRole = function () {
        $http({
            method:'post',
            url:'/role/getRoles.do',
            params :{
                roleName:$scope.roleName
            }
        }).success(function (response) {
            $scope.roleList = response;
            //console.log($scope.roleList.data);
        })
    }
    */

    //新增
    $scope.addRole = function () {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/addRole.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance) {
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    $http({
                        method:'post',
                        url:'/role/addRole.do',
                        data :{
                            roleName:$scope.newRole,
                            roleDesc:$scope.newDesc
                        }
                    }).success(function (response) {
                        if(response.code === 1){
                            ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
                        }else if(response.code === 0){
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        }else if(response.code === -1){
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        }
                        getRolesList();
                    }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                        ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
                    })
                    $uibModalInstance.close();
                }
            }
        });
    }

    //编辑
    $scope.editRole = function (current, $event) {
        console.log("editRole...");
        //TODO
        $event.stopPropagation();//阻止冒泡
    }

    //单个删除
    $scope.singleDelRole = function (current, $event) {
        $http({
            method:'post',
            url:'/role/delRole.do',
            data :{
                roleName:current.roleName
            }
        }).success(function (response) {
            if(response.code === 1){
                ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
            }else if(response.code === 0){
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }else if(response.code === -1){
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }
            getRolesList();
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown  + "!"), "modal-danger", "sm");
        })
        $event.stopPropagation();//阻止冒泡
    }

    //多选删除
    $scope.multipleDelRole = function () {
        console.log("multipleDelRole...");
        //TODO.....
    }


    //选择单个（取消选择单个)
    $scope.changeCurrent = function(current, $event) {
        //计算已选数量 true加， false减
        $scope.count += current.checked ? 1 : -1;
        //判断是否全选，选数量等于数据长度为true
        $scope.selectAll = $scope.count === $scope.roleList.data.length;
        //统计已选对象
        $scope.selectData = [];
        angular.forEach($scope.roleList.data, function(item) {
            if(item.checked){
                $scope.selectData[$scope.selectData.length] = item;
            }
        });
        $event.stopPropagation();//阻止冒泡
    };

    //单击行选中
    $scope.changeCurrents = function(current, $event) {
        if(current.checked == undefined){
            current.checked = true;
        }else{
            current.checked = !current.checked;
        }
        $scope.changeCurrent(current, $event);
    };

    //全选（取消全选）
    $scope.changeAll = function() {
        //console.log(scope.selectAll);
        angular.forEach($scope.roleList.data, function(item) {
            item.checked = $scope.selectAll;
        });
        $scope.count = $scope.selectAll ? $scope.roleList.data.length : 0;
        if ($scope.selectAll) {
            $scope.selectData = $scope.roleList.data;
        } else {
            $scope.selectData = [];
        }
    };


});