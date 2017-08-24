/**
 * Created by 陶鹏飞 on 2017/8/21.
 */
// 'use strict';

cBoard.directive('tree', ['$http', '$interval', '$filter', '$log', function ($http, $interval, $filter, $log) {
    return {
        require: '?ngModel',
        // scope: true,     //坑，这是一个坑呀！
        restrict: 'A',
        link: function ($scope, element, attrs, ngModel) {
            //var opts = angular.extend({}, $scope.$eval(attrs.nlUploadify));
            /*element.bind('click', function(){
             $scope.editDs();
             })*/

            var setting = {
                view: {
                    dblClickExpand: dblClickExpand,
                    //addHoverDom: addHoverDom,
                    // removeHoverDom: removeHoverDom,
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
                            // console.log(treeNode);
                            var b = [];
                            //递归法
                            function traverseTree(node) {
                                if (!node) {
                                    return;
                                }
                                b.push(node.id);
                                if (node.children && node.children.length > 0) {
                                    var i = 0;
                                    for (i = 0; i < node.children.length; i++) {
                                        // this.traverseTree(node.children[i]);
                                        traverseTree(node.children[i]);
                                    }
                                }
                            };
                            traverseTree(treeNode);
                            // console.log(b);

                            //非递归法
                            function traverseTree2(node) {
                                if (!node) {
                                    return;
                                }
                                var stack = [];
                                stack.push(node);
                                var tmpNode;
                                while (stack.length > 0) {
                                    tmpNode = stack.pop();
                                    // traverseNode2(tmpNode);
                                    console.log(tmpNode);
                                    if (tmpNode.children && tmpNode.children.length > 0) {
                                        var i = tmpNode.children.length - 1;
                                        for (i = tmpNode.children.length - 1; i >= 0; i--) {
                                            stack.push(tmpNode.children[i]);
                                        }
                                    }
                                }
                            }

                            traverseTree2(treeNode);
                            // console.log(stack);
                            /*var a = [];
                             a.push(treeNode);*/
                            /*console.log(a);
                             console.log(a.length);
                             var l = a.length;
                             var arr = [];
                             for (var i = 0; i < l; i++) {
                             (function () {
                             var jsonArray = arguments[0];
                             for (var k in jsonArray) {
                             if (k.indexOf('children') != -1 && jsonArray[k] != null) {
                             arguments.callee(jsonArray[k]);
                             } else {
                             if (k == 'name' || k == 'children') {
                             arr.push(jsonArray[k] + '');
                             }
                             }
                             }
                             })(a[i]);
                             }
                             console.log(arr);*/
                            /*var b = [];
                             (function recursiveNodes(a,b) {
                             for (var i = 0, j = b.length; i < a.length; i++){
                             b[j] = a[i].id;
                             /!*b[j] = {
                             id: a[i].id,
                             name: a[i].name
                             }*!/
                             j++;
                             if ( a[i].children ){
                             recursiveNodes(a[i].children,b);
                             }
                             }
                             })();
                             console.log(b);*/
                        });
                    }
                }
            };

            function dblClickExpand(treeId, treeNode) {
                /*console.log(treeId);
                 console.log(treeNode);*/
                return treeNode.level > 0;
            };
            /*var newCount = 1;
             function addHoverDom(treeId, treeNode) {
             var sObj = $("#" + treeNode.tId + "_span");
             if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
             var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
             + "' title='add node' onfocus='this.blur();'></span>";  //onclick
             // + "' title='add node' onfocus='this.blur();' onclick=''></span>";
             sObj.after(addStr);
             var btn = $("#addBtn_"+treeNode.tId);
             if (btn) btn.bind("click", function(){
             /!*console.log(element);
             console.log($(this));*!/
             /!*$(".add").bind('click', function(){
             console.log("add...");
             $scope.newDs();
             })*!/
             $scope.newDs();
             /!*element.bind('click', function(){
             $scope.newDs();
             })*!/
             // console.log(($scope.$parent.newDs)());
             // ($scope.$parent.newDs)()
             // $scope.optFlag = "addBrand";
             // console.log($scope.optFlag);
             // console.log(ngModel);
             var zTree = $.fn.zTree.getZTreeObj("treeDemo");
             zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
             return false;
             });
             };
             function removeHoverDom(treeId, treeNode) {
             $("#addBtn_"+treeNode.tId).unbind().remove();
             };*/
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
                        $scope.curBrand = treeNode.name;
                        //提交父ID参数
                        $scope.pId = treeNode.id;
                        // console.log(treeNode);
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
                        // console.log(treeNode);
                    });
                    $scope.editDs();
                });
                if (delbtn) delbtn.bind("click", function () {
                    // console.log("del...");
                    $scope.optFlag = 'none';
                    // $("#addBtn_"+treeNode.tId).unbind().remove();
                    // console.log(element);
                    // console.log(treeNode);
                    // console.log($scope.selectNode);
                });
            };

            var reloadTree = function () {
                $http({
                    method: 'get',
                    url: '/brand/selectBrand.do'
                }).success(function (response) {
                    // console.log(response.data);
                    let zNodes = [];
                    zNodes = _.map(response.data, function (obj, iteratee, context) {
                        let newArr = [];
                        newArr.push({
                            "id": obj.BrandId,
                            "pId": obj.pBrandId,
                            "name": obj.BrandName,
                            "desc": obj.BrandDesc,
                            "code": obj.BrandCode,
                            "open": true
                        });
                        return newArr[0];
                    })
                    // console.log(zNodes);
                    $.fn.zTree.init(element, setting, zNodes);
                })
            };
            reloadTree();
            /*$interval(function() {
             reloadTree();
             }, 1000);*/
            //监听的数据是一个函数，该函数必须先在父作用域定义
            $scope.$watch("treeStatus", function (newValue, oldValue, $scope) {
                console.log(newValue)
                console.log(oldValue)
                if (newValue && !oldValue) {
                    reloadTree();
                    $scope.treeStatus = "";
                }
            }, true);
            ;

        }
    }
}]);
