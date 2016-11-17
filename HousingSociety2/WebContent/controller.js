
module.controller('StudentController', function ($scope, UserService) {

    $scope.Students = UserService.list();
  
    $scope.saveStudent = function () {
        UserService.save($scope.NewStudent);
        $scope.NewStudent = {};
    }


    $scope.delete = function (id) {

        UserService.delete1(id);
        if ($scope.NewStudent.id == id) $scope.NewStudent = {};
    }

	 $scope.orderByMe = function(x) {
        $scope.myOrderBy = x;
	 }
})

