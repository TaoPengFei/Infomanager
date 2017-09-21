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

});