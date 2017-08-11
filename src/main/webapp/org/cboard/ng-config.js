/**
 * Created by 陶鹏飞 on 2017/8/4.
 */
angular.module('cBoard').config(['$stateProvider', function ($stateProvider) {
    $stateProvider
        .state('user', {
            url: '/user',
            abstract: true,
            template: '<div ui-view></div>'
        })
        .state('dashboard', {
            url: '/dashboard',
            abstract: true,
            template: '<div ui-view></div>'
        })
        .state('mine', {
            url: '/mine',
            abstract: true,
            template: '<div ui-view></div>'
        })
        .state('mine.view', {
            url: '/{id}',
            params: {id: null},
            templateUrl: 'org/cboard/view/dashboard/view.html',
            controller: 'dashboardViewCtrl'
        })
        .state('dashboard.category', {
            url: '/{category}',
            params: {category: null},
            abstract: true,
            template: '<div ui-view></div>',
        })
        .state('dashboard.category.view', {
            url: '/{id}',
            params: {id: null},
            templateUrl: 'org/cboard/view/dashboard/view.html',
            controller: 'dashboardViewCtrl'
        })
        //权限控制路由配置
        .state('config', {
            url: '/config',
            abstract: true,
            template: '<div ui-view></div>'
        })
        //用户路由配置
        .state('config.user', {
            url: '/user',
            templateUrl: 'org/cboard/view/config/user.html',
            controller: 'userCtrl'
        })
        //角色路由配置
        .state('config.role', {
            url: '/role',
            templateUrl: 'org/cboard/view/config/role.html',
            controller: 'roleCtrl'
        })
        //角色-菜单路由配置
        .state('config.roleMenu', {
            url: '/roleMenu',
            templateUrl: 'org/cboard/view/config/roleMenu.html',
            controller: 'roleMenuCtrl'
        })
        //datatables路由配置
        .state('config.datatables', {
            url: '/datatables',
            templateUrl: 'org/cboard/view/config/dataTables.html',
            controller: 'dataTablesCtrl'
        });
    }
]);

angular.module('cBoard').factory('sessionHelper', ["$rootScope", function ($rootScope) {
    var sessionHelper = {
        responseError: function (response) {
            if (response.status == -1) {
                window.location.href = "/";
            } else {
                return response;
            }
        }
    };
    return sessionHelper;
}]);


angular.module('cBoard').config(function ($httpProvider) {
    $httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

    // Override $http service's default transformRequest
    $httpProvider.defaults.transformRequest = [function (data) {
        /**
         * The workhorse; converts an object to x-www-form-urlencoded serialization.
         * @param {Object} obj
         * @return {String}
         */
        var param = function (obj) {
            var query = '';
            var name, value, fullSubName, subName, subValue, innerObj, i;

            for (name in obj) {
                value = obj[name];

                if (value instanceof Array) {
                    for (i = 0; i < value.length; ++i) {
                        subValue = value[i];
                        fullSubName = name + '[' + i + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                } else if (value instanceof Object) {
                    for (subName in value) {
                        subValue = value[subName];
                        fullSubName = name + '[' + subName + ']';
                        innerObj = {};
                        innerObj[fullSubName] = subValue;
                        query += param(innerObj) + '&';
                    }
                } else if (value !== undefined && value !== null) {
                    query += encodeURIComponent(name) + '='
                        + encodeURIComponent(value) + '&';
                }
            }

            return query.length ? query.substr(0, query.length - 1) : query;
        };

        return angular.isObject(data) && String(data) !== '[object File]'
            ? param(data)
            : data;
    }];

    $httpProvider.interceptors.push('sessionHelper');

});


angular.module('cBoard').config(function ($translateProvider, $translatePartialLoaderProvider) {
    $translatePartialLoaderProvider.addPart('cboard');
    $translateProvider.useLoader('$translatePartialLoader', {
        urlTemplate: '/i18n/{lang}/{part}.json'
    });

    $translateProvider.preferredLanguage(settings.preferredLanguage);
});