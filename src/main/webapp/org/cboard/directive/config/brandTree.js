/**
 * Created by 陶鹏飞 on 2017/8/21.
 */
'use strict';

cBoard.directive('tree',['$http', function($http){
    return{
        require: '?ngModel',
        // scope: true,     //坑，这是一个坑呀！
        restrict: 'A',
        link: function ($scope, element, attrs, ngModel){
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
                 if ($("#diyBtn_"+treeNode.id).length>0) return;
                var editStr = "<span class='addTree button add' id='addBtn_" + treeNode.id + "' title='增加' onfocus='this.blur();'></span>"
                            + "<span class='addTree button edit' id='editBtn_" + treeNode.id + "' title='修改' onfocus='this.blur();'></span>"
                            + "<span class='addTree button remove' id='delBtn_" + treeNode.id + "' title='删除' onfocus='this.blur();'></span>";
                aObj.append(editStr);
                var addbtn = $("#addBtn_"+treeNode.id);
                var editbtn = $("#editBtn_"+treeNode.id);
                var delbtn = $("#delBtn_"+treeNode.id);
                if (addbtn) addbtn.bind("click", function(){
                    $scope.$apply(function () {
                        $scope.curBrand = treeNode.name;
                        console.log($scope);
                    });
                    $scope.newDs();
                });
                if (editbtn) editbtn.bind("click", function(){
                    $scope.editDs();
                });
                if (delbtn) delbtn.bind("click", function(){
                    console.log("del...");
                    // $("#addBtn_"+treeNode.tId).unbind().remove();
                    // console.log(element);
                });
            };
            $http({
                method: 'get',
                url: '/brand/selectBrand.do'
            }).success(function (response) {
                console.log(response.data);
                let zNodes = [];
                zNodes = _.map(response.data,function (obj, iteratee, context) {
                    let newArr = [];
                    newArr.push({
                        "id": obj.BrandId,
                        "pId": obj.pBrandId,
                        "name": obj.BrandName,
                        "desc": obj.BrandDesc,
                        "open": true
                    });
                    return newArr[0];
                })
                // console.log(Nodes);
                $.fn.zTree.init(element, setting, zNodes);
            })
        }
    }
}]);
