powerteam.controller('signIn', ['$scope', '$http', 'ngNotify', '$uibModal', function ($scope, $http, ngNotify, $uibModal) {
    $scope.User = {
        userName: null,
        password: null
    };

    $scope.query = {
        pageNum: 1,
        total: 0,
        pageSize: 10
    };
    $scope.list = [];

    // 滑动验证
    $('#drag').drag();

    // 登陆
    $scope.loginSystem = function () {
        // 校验
        if ($scope.User.userName === "" || $scope.User.userName === null) {
            ngNotify.set("请输入用户名!", 'error');
            return;
        } else if ($scope.User.password === "" || $scope.User.password === null) {
            ngNotify.set("请输入密码!", 'error');
            return;
        }
        if (Slide.Ver === "false") {
            ngNotify.set("请滑动验证!", 'error');
            return;
        }

        // 请求
        $http.post('signIn', $scope.User).then(function (response) {
            if (response.data.success) {
                go('dashboard');
            } else {
                ngNotify.set(response.data.message, 'error');
            }
        });
    };

    // 忘记密码
    $scope.forgotPassword= function () {
        $uibModal.open({templateUrl: 'Forgot.html', controller: 'forgot'});
    };

    // $scope.find = function () {
    //     $http.post('user/find', $scope.query).then(function (response) {
    //         $scope.list = response.data.list;
    //         $scope.query.pageNum = response.data.pageNum;
    //         $scope.query.pageSize = response.data.pageSize;
    //         $scope.query.total = response.data.total;
    //     });
    // };

    // 注册
    $scope.showAdd = function () {
        $uibModal.open({templateUrl: 'Add.html', controller: 'add'}).result.then(function () {
            // $scope.find();
        });
    };

}]);

/**
 * 注册
 */
powerteam.controller('add', ['$scope', '$http', '$uibModalInstance', 'ngNotify', function ($scope, $http, $uibModalInstance, ngNotify) {
    $scope.Model = {
        userName: null,
        realName: null,
        gender: 1,
        password: null,
        avatar: 'img/avatar/avatar1.png'
    };

    $scope.ok = function () {
        $http.post('user/add', $scope.Model).then(function (response) {
            if (response.data.success) {
                ngNotify.set('注册成功', 'success');
                $uibModalInstance.close();
            } else {
                ngNotify.set(response.data.message, 'error');
            }
        });
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
}]);

/**
 * 忘记密码
 */
powerteam.controller('forgot', ['$scope', '$http', '$uibModalInstance', 'ngNotify', function ($scope, $http, $uibModalInstance, ngNotify) {
    $scope.Model = {
        userName: null,
        realName: null,
        gender: 1,
        password: null,
        avatar: 'img/avatar/avatar1.png'
    };

    $scope.submit = function () {
        $http.post('user/add', $scope.Model).then(function (response) {
            if (response.data.success) {
                ngNotify.set('注册成功', 'success');
                $uibModalInstance.close();
            } else {
                ngNotify.set(response.data.message, 'error');
            }
        });
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
}]);