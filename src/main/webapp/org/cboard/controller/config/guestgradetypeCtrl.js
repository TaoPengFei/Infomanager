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

});