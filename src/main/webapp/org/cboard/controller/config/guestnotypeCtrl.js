/**
 * Created by 陶鹏飞 on 2017/9/20.
 */
cBoard.controller('guestnotypeCtrl', function ($rootScope, $scope, $http, dataService, $uibModal, ModalUtils, $filter, chartService) {

    var translate = $filter('translate');

///表格的头部
    $scope.guestnotypeHeaderInfos = [
        {'name': '人数名称', 'col': 'GuestNoTypeName'},
        {'name': '人数描述', 'col': 'GuestNoTypeDesc'},
        {'name': '人数上限', 'col': 'TopGuestQty'},
        {'name': '人数下限', 'col': 'BottomGuestQty'},
        {'name': '人数状态', 'col': 'Status'},
        {'name': '创建时间', 'col': 'CreateTime'},
        {'name': '更新时间', 'col': 'UpdateTime'},
        {'name': '操作'}
    ];

    //初始化
    var getGuestNoTypeList = function () {
        $http({
            method: 'get',
            url: './guestnotype/getGuestNoType.do'
            /*params: {
             userName: $scope.userName
             }*/
        }).success(function (response) {
            $scope.guestNoTypeList = response;
        }).error(function (XMLHttpRequest, textStatus, errorThrown) {
            ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
        });
    };
    getGuestNoTypeList();

});