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
    
    $scope.addGuestGradeType = function (current, $event) {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/addGuestGradeType.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.save = function () {
                    $http({
                        method: 'POST',
                        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
                        url: './guestgradetype/addGuestGradeType.do',
                        data: JSON.stringify({
                            GuestGradeTypeName: $scope.newGuestGradeTypeName,
                            Status: $scope.newStatus,
                            TopAmt: $scope.newTopAmt,
                            BottomAmt: $scope.newBottomAmt,
                            GuestGradeTypeDesc: $scope.newGuestGradeTypeDesc
                        })
                    }).success(function (response) {
                        if (response.code === 0) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        } else if (response.code === 1) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
                        } else if (response.code === -1) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        }
                        getGuestGradeTypeList();
                    }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                        ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                    });
                    $uibModalInstance.close();
                }
            }
        });
    }

    $scope.editGuestGradeType = function (current, $event) {
        $uibModal.open({
            templateUrl: 'org/cboard/view/config/modal/editGuestGradeType.html',
            //windowTemplateUrl: 'org/cboard/view/util/modal/window.html',
            backdrop: false,
            controller: function ($scope, $uibModalInstance, $http) {
                $scope.close = function () {
                    $uibModalInstance.close();
                };
                $scope.editGuestGradeTypeName = current.GuestGradeTypeName;
                $scope.editStatus = current.Status;
                $scope.editTopAmt = current.TopAmt;
                $scope.editBottomAmt = current.BottomAmt;
                $scope.editGuestGradeTypeDesc = current.GuestGradeTypeDesc;
                $scope.save = function () {
                    $http({
                        method: 'POST',
                        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
                        url: './guestgradetype/updateGuestGradeType.do',
                        data: JSON.stringify({
                            GuestGradeTypeId: current.GuestGradeTypeId,
                            GuestGradeTypeName: $scope.editGuestGradeTypeName,
                            Status: $scope.editStatus,
                            TopAmt: $scope.editTopAmt,
                            BottomAmt: $scope.editBottomAmt,
                            GuestGradeTypeDesc: $scope.editGuestGradeTypeDesc
                        })
                    }).success(function (response) {
                        if (response.code === 0) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        } else if (response.code === 1) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
                        } else if (response.code === -1) {
                            ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
                        }
                        getGuestGradeTypeList();
                    }).error(function (XMLHttpRequest, textStatus, errorThrown) {
                        ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
                    });
                    $uibModalInstance.close();
                }
            }
        });
    }

    $scope.delGuestGradeType = function (current, $event) {
        $http({
            method: 'POST',
            headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
            url: './guestgradetype/deleteGuestGradeType.do',
            data: JSON.stringify({
                GuestGradeTypeId: (function () {
                    var delArr = [];
                    delArr.push(current.GuestGradeTypeId);
                    return delArr;
                })()
            })
        }).success(function (response) {
            if (response.code === 0) {
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            } else if (response.code === 1) {
                ModalUtils.alert(translate(response.msg + "!"), "modal-success", "md");
            } else if (response.code === -1) {
                ModalUtils.alert(translate(response.msg + "!"), "modal-danger", "md");
            }
            getGuestGradeTypeList();
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
        });
    }

});