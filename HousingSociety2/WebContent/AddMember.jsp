<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.min.js"></script>



<div ng-app="app"  ng-controller="StudentController" ng-init="myOrderBy">
    <form name="studentForm">
    <table>
    <tr>
       <td><a href="index.jsp">Home</td>
    </tr>
    <tr>
       	<td><label>First Name</label></td> 
       	<td>
		<input name="firstname" PlaceHolder="Enter Your First Name" ng-model="NewStudent.firstname" required>
		<span ng-show="studentForm.firstname.$touched && studentForm.firstname.$invalid">The name is required.</span>
		</td>
    </tr>
    <tr>
    	<td><label>Last Name</label></td> 
	    <td><input name="lastname" PlaceHolder="Enter Your Last Name" ng-model="NewStudent.lastname" required>
		<span ng-show="studentForm.lastname.$touched && studentForm.lastname.$invalid">The name is required.</span></td>
    </tr>
    <tr>
    	<td><label>Email</label></td> 
    	<td><input type="email" name="email" PlaceHolder="Enter Your Email" ng-model="NewStudent.email" required>
		<span style="color:red" ng-show="studentForm.email.$dirty && studentForm.email.$invalid">Invalid Email</span></td>
    </tr>
    <tr>
    	<td><label>Date Of Joining</label></td> 
        <td><input type="text" name="doj" PlaceHolder="Enter Joining Date" ng-model="NewStudent.doj"/></td>
    </tr>
    <tr>
    	<td><label>Extention</label></td> 
        <td><input type="text" name="ext" PlaceHolder="Enter Extention No" ng-model="NewStudent.ext"/></td>
    </tr>
    <tr>
    	<td><label>On Bench</label></td> 
        <td><input type="text" name="bench" PlaceHolder="Enter Status" ng-model="NewStudent.bench"/></td>
	</tr>
    <tr>
       <td> <input type="hidden" ng-model="NewStudent.id" />
     <input type="button" value="Add Row" ng-click="saveStudent()"/></td>
    </tr>
     </table>
    </form>

<table border=1>
<thead> 
			<tr>
                <th ng-click="orderByMe('firstname')">First Name</th>
                <th ng-click="orderByMe('lastname')">Last Name</th>
                <th ng-click="orderByMe('email')">Email</th>
                <th ng-click="orderByMe('doj')">Date of Joining</th>
                <th ng-click="orderByMe('ext')">Extension</th>
                <th ng-click="orderByMe('bench')">On Bench</th>
				<th>Actions</th>
                <th></th>
              </tr>

</thead>
<tbody>
<tr ng-repeat="Student in Students | orderBy:myOrderBy">
    <td>{{ Student.firstname }}</td>
    <td>{{ Student.lastname }}</td>
    <td>{{ Student.email }}</td>
	<td>{{ Student.doj }}</td>
	<td>{{ Student.ext }}</td>
	<td>{{ Student.bench }}</td>
    <td>
        <br><input type="button" value="Delete Row" ng-click="delete(Student.id)"/>
    </td>
 </tr>	
</tbody>
</table>    
</div>
<script src="app.js">

</script>
<script src="controller.js"></script>

</body>
</html>