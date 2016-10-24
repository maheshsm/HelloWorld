<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			<tr><td><button ng-click="createEmployee()">Create Employee</button></td></tr>
		</form>
	</div>
	<br/><br/>
	
	<table border="1">
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Department</th>
				<th>Designation</th>
				<th>Name</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="u in employees">
				<td><span ng-bind="u.empid"></span></td>
				<td><span ng-bind="u.department"></span></td>
				<td><span ng-bind="u.desigination"></span></td>
				<td><span ng-bind="u.ename"></span></td>
			</tr>
		</tbody>
	</table>


</body>

<script>

'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	$scope.employee= {empid:null,department:'',desigination:'',ename:''};
	$scope.employees=[];
	
	fetchAllEmployee();
	
	function fetchAllEmployee()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllEmployee()
	            .then(	            	
	            function(d) {
	              $scope.employees = d;
	            },
	            function(errResponse){
	                console.error('Error while fetching Users');
	            }
	        );	   
	}
	
	$scope.createEmployee= function()
	    {
		  alert("IN Create Employee Function");
	    	EmployeeService.createEmployee($scope.employee).then(fetchAllEmployee,function(errorMsg)
	    	{
	    		console.error('Failed to create');
	    	});
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

	this.createEmployee = function (employee)
	{
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI,employee)
		.then(
				function(response) 
				{
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