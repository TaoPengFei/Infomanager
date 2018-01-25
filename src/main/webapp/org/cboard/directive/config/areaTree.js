/**
 * Created by 陶鹏飞 on 2017/8/25.
 */

cBoard.directive('area', ['$http', '$interval', '$filter', '$log', function ($http, $interval, $filter, $log) {
    return {
        require: '?ngModel',
        restrict: 'A',
        link: function ($scope, element, attrs, ngModel) {
            var setting = {
                edit: {
                    drag: {
                        isMove: true,
                        prev: false,
                        inner: true,
                        next: false
                    },
                    enable: true,
                    showRemoveBtn: false,
                    showRenameBtn: false
                },
                view: {
                    dblClickExpand: dblClickExpand,
                    addDiyDom: addDiyDom,
                    selectedMulti: false
                },
                data: {
                    key: {
                        title: "desc"
                    },
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onClick: function (event, treeId, treeNode, clickFlag) {
                        $scope.$apply(function () {
                            ngModel.$setViewValue(treeNode);
                        });
                    },
                    onDrop: areaTreeDrop
                }
            };

            /**
             *
             * @param treeId
             * @param treeNode
             * @returns {boolean}
             */
            function dblClickExpand(treeId, treeNode) {
                return treeNode.level > 0;
            };

            /**
             *  拖拽时的事件控制
             * @param event
             * @param treeId
             * @param treeNodes
             * @param targetNode
             * @param moveType
             */
            function areaTreeDrop(event, treeId, treeNodes, targetNode, moveType) {
                $scope.dropAreaId = treeNodes[0].id;
                $scope.dropAreapPId = targetNode.id;
                $scope.areaTreeDrop();
            }

            /**
             *
             * @param treeId
             * @param treeNode
             */
            function addDiyDom(treeId, treeNode) {
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
                        $scope.curArea = treeNode.name;
                        //提交父ID参数
                        $scope.pId = treeNode.id;
                    });
                    $scope.addArea.Code = "";
                    $scope.addArea.Name = "";
                    $scope.addArea.Desc = "";
                    $scope.optFlagArea = 'addArea';
                });
                if (editbtn) editbtn.bind("click", function () {
                    $scope.$apply(function () {
                        //提交父ID参数
                        $scope.curAreapId = treeNode.pId;
                        $scope.curAreaId = treeNode.id;
                        $scope.editArea.Code = treeNode.code;
                        $scope.editArea.Name = treeNode.name;
                        $scope.editArea.Desc = treeNode.desc;
                    });
                    $scope.optFlagArea = 'editArea';
                });
                if (delbtn) delbtn.bind("click", function () {

                    // $scope.delAreapId = treeNode.pId;
                    $scope.optFlagArea = 'none';
                    $scope.searchAreaTree(treeNode);
                    $scope.delArea(treeNode.pId);
                });
            };

            var reloadAreaTree = function () {
                $http({
                    method: 'get',
                    url: './area/getArea.do'
                }).success(function (response) {
                    let zNodes = [];
                    zNodes = _.map(response.data, function (obj, iteratee, context) {
                        let newArr = [];
                        newArr.push({
                            "id": obj.AreaId,
                            "pId": obj.pAreaId,
                            "name": obj.AreaName,
                            "desc": obj.AreaDesc,
                            "code": obj.AreaCode,
                            "open": true
                        });
                        return newArr[0];
                    });
                    zNodes.push({
                        "id": 0,
                        "pId": -1,
                        "name": "Root",
                        "desc": "Root",
                        "code": "-1",
                        "open": true
                    });
                    // console.log(zNodes);
                    $.fn.zTree.init(element, setting, zNodes);
                })
            };
            reloadAreaTree();
            //监听的数据是一个函数，该函数必须先在父作用域定义
            $scope.$watch("treeStatusArea", function (newValue, oldValue, $scope) {
                if (newValue && !oldValue) {
                    reloadAreaTree();
                    $scope.treeStatusArea = "";
                }
            }, true);
        }
    }
}]);
