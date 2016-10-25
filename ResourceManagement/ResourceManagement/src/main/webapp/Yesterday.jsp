<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: 	#DEB887}

th {
    background-color: #A52A2A;
    color: #FFE4E1;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Management System</title>

</head>
<body ng-app="myApp" ng-controller="myController">

	<div>
		<form>
		<table>
			<tr><td>Employee Id</td><td><input type="text" ng-model="employee.username"></td></tr> 
			<tr><td>Department</td><td><input type="password" ng-model="employee.password"></td></tr>
			<tr><td><button ng-click="loginUser()">Create Employee</button></td></tr>
			</table>
		</form>
	</div>
	
</body>

<script>

'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	$scope.employee= {empid:null,department:'',desigination:'',ename:'',username:'',password:''};    
	
	$scope.loginUser = function()
	    {
		  alert("IN Create Employee Function");
	    	EmployeeService.loginUser($scope.employee);
	    }
	
}]);


angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{
	var REST_SERVICE_URI = 'http://localhost:8080/ResourceManagement/employees/';

	this.loginUser = function (employee)
	{
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI,employee)
		.then(
				function(response) 
				{
					alert("Employee Created Successfully");
					deferred.resolve(response.data);
				
				},
				function(reason) 
				{
					console.error("Error while creating user");
					deferred.reject(reason);
		
				});
		
		return deferred.promise;
	}
}]);
 
 </script>
</html>