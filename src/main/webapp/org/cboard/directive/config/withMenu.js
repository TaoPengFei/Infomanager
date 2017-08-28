/**
 * Created by 陶鹏飞 on 2017/8/28.
 */
// 'use strict';

cBoard.directive('with', ['$http', '$interval', '$filter', '$log', function ($http, $interval, $filter, $log) {
    return {
        require: '?ngModel',
        restrict: 'A',
        link: function ($scope, element, attrs, ngModel) {
            var setting = {
                edit: {
                    enable: true,
                    showRemoveBtn: false,
                    showRenameBtn: false,
                    drag: {
                        isCopy: true,
                        isMove: true,
                        prev: true,
                        next: true,
                        inner: true
                    }
                },
                view: {
                    dblClickExpand: false,
                    // dblClickExpand: dblClickExpand,
                    // addDiyDom: addDiyDom,
                    selectedMulti: false
                },
                data: {
                    key: {
                        title: "name"
                    },
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    beforeDrag: beforeDrag,
                    beforeDrop: beforeDrop,
                    onClick: function (event, treeId, treeNode, clickFlag) {
                        $scope.$apply(function () {
                            ngModel.$setViewValue(treeNode);
                        });
                    },
                    onDblClick: withoutTreeOnDblClick
                }
            };

            function dblClickExpand(treeId, treeNode) {
                return treeNode.level > 0;
            };

            function beforeDrag(treeId, treeNodes) {
                for (var i=0,l=treeNodes.length; i<l; i++) {
                    if (treeNodes[i].drag === false) {
                        return false;
                    }
                }
                return true;
            };

            function beforeDrop(treeId, treeNodes, targetNode, moveType) {
                return targetNode ? targetNode.drop !== false : true;
            };

            function withoutTreeOnDblClick(event, treeId, treeNode) {
                $scope.withMenuEdit();
                // alert(treeNode ? treeNode.tId + ", " + treeNode.name : "isRoot");
            };
            /*function addDiyDom(treeId, treeNode) {
                var aObj = $("#" + treeNode.tId + "_a");
                if ($("#diyBtn_" + treeNode.id).length > 0) return;
                var editStr = "<span class='addTree button add' id='addBtn_" + treeNode.id + "' title='增加' onfocus='this.blur();'></span>"
                    + "<span class='addTree button edit' id='editBtn_" + treeNode.id + "' title='修改' onfocus='this.blur();'></span>"
                    + "<span class='addTree button remove' id='delBtn_" + treeNode.id + "' title='删除' onfocus='this.blur();'></span>";
                aObj.append(editStr);
                var addbtn = $("#addBtn_" + treeNode.id);
                var editbtn = $("#editBtn_" + treeNode.id);
                var delbtn = $("#delBtn_" + treeNode.id);
                if (addbtn) addbtn.bind("click", function () {
                    $scope.$apply(function () {
                        $scope.curBrand = treeNode.name;
                        //提交父ID参数
                        $scope.pId = treeNode.id;
                    });
                    $scope.addBrand.Code = "";
                    $scope.addBrand.Name = "";
                    $scope.addBrand.Desc = "";
                    $scope.newDs();
                });
                if (editbtn) editbtn.bind("click", function () {
                    $scope.$apply(function () {
                        //提交父ID参数
                        $scope.curBrandpId = treeNode.pId;
                        $scope.curBrandId = treeNode.id;
                        $scope.editBrand.Code = treeNode.code;
                        $scope.editBrand.Name = treeNode.name;
                        $scope.editBrand.Desc = treeNode.desc;
                    });
                    $scope.editDs();
                });
                if (delbtn) delbtn.bind("click", function () {
                    $scope.optFlag = 'none';
                    $scope.searchTree(treeNode);
                    $scope.delBrand();
                });
            };*/

            $scope.$watch("selectedRoleName",function () {
                $http({
                    method: 'get',
                    url: '/roleMenuTree/getMenusTree.do',
                    params: {
                        roleName: $scope.selectedRoleName
                    }
                }).success(function (response) {
                    let zNodes = [];
                    // let arr = [];
                    console.log(response.menuWithRole);
                    zNodes = _.map(response.menuWithRole, function (obj, iteratee, context) {
                        let newArr = [];
                        newArr.push({
                            "id": obj.menuid,
                            "pId": obj.pid,
                            "name": obj.menuname
                            /*"desc": obj.BrandDesc,
                             "code": obj.BrandCode,*/
                        });
                        console.log(newArr);
                        return newArr[0];
                    });
                    /*arr.push({
                        "id": 0,
                        "pId": -1,
                        "name": "Root",
                        "open": true
                        /!*"desc": obj.BrandDesc,
                         "code": obj.BrandCode,
                         "open": true*!/
                    });
                    $.fn.zTree.init(element, setting, zNodes.concat(arr));*/
                    $.fn.zTree.init(element, setting, zNodes);
                    var treeObj = $.fn.zTree.getZTreeObj("withMenuTree");
                    var nodes = treeObj.getNodes();
                    for (var i = 0; i < nodes.length; i++) { //设置节点展开
                        treeObj.expandNode(nodes[i], true, false, true);
                    }
                })
            })
            //监听的数据是一个函数，该函数必须先在父作用域定义
            /*$scope.$watch("roleStatus", function (newValue, oldValue, $scope) {
                if (newValue && !oldValue) {
                    reloadWithMenuTree();
                    $scope.roleStatus = "";
                }
            }, true);*/
        }
    }
}]);

