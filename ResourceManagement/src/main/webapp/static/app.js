'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	$scope.employee= {username:'',password:''};
		
	function fetchsEmployee()
	{
	    	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchEmployee()
	            .then(	            	
	            function(d) 
	            {
	              $scope.employees = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
}]);

