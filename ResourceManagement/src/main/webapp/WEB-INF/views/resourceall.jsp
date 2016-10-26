<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>

		Select By Projects <select ng-model="selectedName"
			ng-options="ProjectTable.proj_name for ProjectTable in projects"></select>

		Select By Roles <select ng-model="selectedName"
			ng-options=" RoleTable.role for RoleTable in roles"></select>

	<table border="1">
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Department</th>
				<th>Designation</th>
				<th>UserName</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="e in employees">
				<td><span ng-bind="e.empid"></span></td>
				<td><span ng-bind="e.department"></span></td>
				<td><span ng-bind="e.desigination"></span></td>
				<td><span ng-bind="e.username"></span></td>
				<td><span ng-bind="e.role"></span></td>
				<td><span ng-bind="e.role"></span></td>
			</tr>
		</tbody>
	</table>
	

	</div>

	

</body>

<script>
	
'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	
	$scope.resources=[];
	$scope.projects=[];
	$scope.roles=[];

	fetchAllProjects();
	
	fetchAllRoles();
		
	function fetchAllProjects()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllProjects()
	            .then(	            	
	            function(d) {
	              $scope.projects = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
	function fetchAllRoles()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllRoles()
	            .then(	            	
	            function(d) {
	              $scope.roles = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
	function fetchAllResources()
	{
	    	alert("In Fetch Resource Function"); 
	        UserService.fetchAllResources()
	            .then(	            	
	            function(d) {
	              $scope.resources = d;
	            },
	            function(errResponse){
	                console.error('Error while fetching Users');
	            }
	        );	   
	}
	
	/* function employeeFit()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.employeeFit()()
	            .then(	            	
	            function(d) {
	              $scope.projects = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
	function employeeUnfit()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.employeeUnfit()
	            .then(	            	
	            function(d) {
	              $scope.roles = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	} */
	
}]);


angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{

	var REST_SERVICE_URI1 = 'http://localhost:8080/ResourceManagement/projects/';
	
	var REST_SERVICE_URI2 = 'http://localhost:8080/ResourceManagement/roles/';
	
	var REST_SERVICE_URI3 = 'http://localhost:8080/ResourceManagement/resources/';
	
	this.fetchAllProjects= function () 
	{
		alert(REST_SERVICE_URI1);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI1)
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

	this.fetchAllRoles= function () 
	{
		alert(REST_SERVICE_URI2);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI2)
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
	
	this.fetchAllResources= function () 
	{
		alert(REST_SERVICE_URI3);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI3)
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

	/* this.employeeFit= function () 
	{
		alert(REST_SERVICE_URI1);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI3)
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

	this.employeeUnfit= function () 
	{
		alert(REST_SERVICE_URI3);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI2)
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
	}	 */
}]);

</script>
</html>