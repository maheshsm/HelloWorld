angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{

	var REST_SERVICE_URI = 'http://localhost:8080/ResourceManagement/employees/';

	this.fetchEmployee= function () 
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
}]);