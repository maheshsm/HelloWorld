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
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body ng-app="myApp" ng-controller="myController">

	<div>
		<table>
		<form>
			<tr><td>Employee Id</td><td><input type="text" ng-model="employee.empid"></td></tr> 
			<tr><td>Department</td><td><input type="text" ng-model="employee.department"></td></tr>
			<tr><td>Designation</td><td><input type="text" ng-model="employee.desigination"></td></tr>
			<tr><td>Employee Name</td><td><input type="text" ng-model="employee.ename"></td></tr>
			<tr><td>User Name</td><td><input type="text" ng-model="employee.username"></td></tr>
			<tr><td>Password</td><td><input type="password" ng-model="employee.password"></td></tr>
			<tr><td><button ng-click="loginUser()">Create Employee</button></td></tr>
		</form>
	</div>
	<br/><br/>
	
	<table border="1">
		<thead>
			<tr>				
				<th ng-click="orderByMe('empid')">Employee Id</th>
                <th ng-click="orderByMe('department')">Department</th>
                <th ng-click="orderByMe('desigination')">Designation</th>
                <th ng-click="orderByMe('ename')">Name</th>
                <th ng-click="orderByMe('username')">User Name</th>
                <th ng-click="orderByMe('password')">Password</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="u in employees">
				<td><span ng-bind="u.empid"></span></td>
				<td><span ng-bind="u.department"></span></td>
				<td><span ng-bind="u.desigination"></span></td>
				<td><span ng-bind="u.ename"></span></td>
				<td><span ng-bind="u.username"></span></td>
				<td><span ng-bind="u.password"></span></td>
			</tr>
		</tbody>
	</table>


</body>

<script>

'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	$scope.employee= {empid:null,department:'',desigination:'',ename:'',username:'',password:''};
	$scope.employees=[];
	
	function fetchAllEmployee()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllEmployee()
	            .then(	            	
	            function(d) {
	              $scope.employees = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
	$scope.loginUser = function()
	    {
		  alert("IN Create Employee Function");
	    	EmployeeService.loginUser($scope.employee).then(fetchAllEmployee,function(errorMsg)
	    	{
	    		alert('Failed to create');
	    	});
	    }
	$scope.orderByMe = function(x) 
	{
		alert('In Order');
        $scope.myOrderBy = x;
	}	
}]);


angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{

	var REST_SERVICE_URI = 'http://localhost:8080/ResourceManagement/employees/';


	this.fetchAllEmployee= function () 
	{
		alert(REST_SERVICE_URI);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI)
		.then(
				function (response) 
				{
					deferred.resolve(response.data);
				},
				function(errResponse)
				{
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				}
		);
		return deferred.promise;
	}

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