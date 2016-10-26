<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Management System</title>

</head>
<body ng-app="myApp" ng-controller="myController">

	<div>
    	Select By Project <select ng-model="projectName" ng-options="ProjectTable.proj_name for ProjectTable in projects"></select>
		
		Select By Roles   <select ng-model="selectedName" ng-options=" RoleTable.role for RoleTable in roles"></select>
		
		<br/><br/><br/>
		<table border="1">
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Department</th>
				<th>Designation</th>
				<th>Employee Name</th>
				<th>Billing</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="e in employees">
				<td><span ng-bind="e.rpid"></span></td>
				<td><span ng-bind="e.billing"></span></td>
				<td><span ng-bind="e.start_date"></span></td>
				<td><span ng-bind="e.end_date"></span></td>
			</tr>
		</tbody>
	</table>
		
		
	</div>	
	
</body>

<script>

'use strict'

var app = angular.module('myApp', []);
 
angular.module('myapp').factory('EmployeeService',['$http', '$q', function($http, $q)
{
	 
	 var REST_SERVICE_URI = 'http://localhost:8080/ResourceManagement/projects/';
	 
	 var REST_SERVICE_URI1 = 'http://localhost:8080/ResourceManagement/roles/';
	 
	 var REST_SERVICE_URI2 = 'http://localhost:8080/ResourceManagement/resources/';
		 
	 var factory = {
			 		fetchAllProjects:fetchAllProjects,
			 		fetchAllRoles:fetchAllRoles,
			 		fetchAllResourcess:fetchAllResources
	 			   };
	 
	 return factory;
	
	function fetchAllProjects()
	{
		alert('projects');
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
	
	function fetchAllRoles()
	{
		alert('roles');
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI1)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
	
	function fetchAllResources()
	{
		alert('resources');
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI2)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
}]);
  
angular.module('myapp').controller('myController', ['$scope', 'EmployeeService', function($scope, EmployeeService)
{
	 		var self = this;
			
	 		self.projects = [];
	 		self.roles = [];
	 		self.resources = [];
	 		
	 		fetchAllProjects();
	 		 
	 	    function fetchAllProjects()
	 	    {
	 	    	alert('projects url');
	 	        EmployeeService.fetchAllProjects()
	 	            .then(
	 	            function(d) {
	 	                self.projects = d;
	 	            },
	 	            function(errResponse){
	 	                console.error('Error while fetching Users');
	 	            }
	 	        );
	 	    }
	 	    
	 	   fetchAllRoles();
	 	  
	 	    function fetchAllRoles()
	 	    {
	 	    	alert('roles url');
	 	    	EmployeeService.fetchAllRoles()
	 	            .then(
	 	            function(d) {
	 	                self.roles = d;
	 	            },
	 	            function(errResponse){
	 	                console.error('Error while fetching Users');
	 	            }
	 	        );
	 	    }
	 	    
	 	   fetchAllResources();
	 	  
	 	    function fetchAllResources()
	 	    {
	 	    	alert('resources url');
	 	    	EmployeeService.fetchAllResources()
	 	            .then(
	 	            function(d) {
	 	                self.resources = d;
	 	            },
	 	            function(errResponse){
	 	                console.error('Error while fetching Users');
	 	            }
	 	        );
	 	    }
 }]);
 
 
 

/* app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	
	$scope.projects=[];
	$scope.roles=[];
	$scope.employees=[];
	var projectname;

	fetchAllProjects();
	
	fetchAllRoles();
	
	fetchAllResources();
		
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
	    	alert("In Fetch Resources Function"); 
	        EmployeeService.fetchAllResources()
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
	
}]);
 */
 
</script>
</html>

