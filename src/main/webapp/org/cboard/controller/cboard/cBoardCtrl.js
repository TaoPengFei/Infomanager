/**
 * Created by yfyuan on 2016/7/19.
 */
cBoard.controller('cBoardCtrl', function ($scope, $location, $http, $window, $q, md5) {

    $scope.avatar = '/dist/img/user-male-circle-blue-128.png';
    $scope.username = "admin";
    console.log($window.sessionStorage);

    /*$scope.userName = userName;
    console.log($scope.userName);*/
    /*
     $scope.collection = {};
     $scope.collection.p1 = $scope.roleName;
     $scope.collection.p2 = $scope.userName;
     console.log($scope.collection);
     $scope.$watch('collection', function () {
     alert("changed!");
     }, true);
     */

    /*$http({
        method: 'get',
        // url: '../user/user.do'
        url: '../user/login.do'
    }).success(function (response) {
        // $scope.roleList = response;
        // console.log(response)
    }).error(function (XMLHttpRequest, textStatus, errorThrown) {
        ModalUtils.alert(translate(errorThrown + "!"), "modal-danger", "sm");
    });*/
});