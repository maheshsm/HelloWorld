package com.cybage.resourcemanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.service.IEmployeeService;


@RestController
public class StudentManagementController 
{

	@Autowired
	IEmployeeService employeeService;
	
	@RequestMapping(value = "/employees/", method = RequestMethod.GET)
	public ResponseEntity<List<Employee>> listAllUsers() 
	{
		System.out.println("In List Student Controller . . . ");
		List<Employee> users = employeeService.listEmployee();

		return new ResponseEntity<List<Employee>>(users, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/employees/", method = RequestMethod.POST)
	public ResponseEntity<Void> createUser(@RequestBody Employee employee, UriComponentsBuilder ucBuilder) 
	{
		
	    System.out.println("Creating User " + employee.getEmpid());

	    employeeService.addEmployee(employee);

	    HttpHeaders headers = new HttpHeaders();
	    
	    return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	/*@RequestMapping(value = "/searchStudent/{rollno}", method = RequestMethod.GET)
	public ResponseEntity<Student> searchStudent(@PathVariable("rollno") Integer rollno , UriComponentsBuilder ucBuilder) 
	{
	    System.out.println("Getting Student " + rollno);

	    studentService.searchStudent(rollno);

	    HttpHeaders headers = new HttpHeaders();
	    
	    return new ResponseEntity<Student>(headers, HttpStatus.CREATED);
	}
*/

}




/*	  @RequestMapping(value = "/students/", method = RequestMethod.POST)
public ResponseEntity<Void> createUser(@RequestBody Student employee, UriComponentsBuilder ucBuilder) 
{
    System.out.println("Creating User " + employee.getFirstname());

    studentService.addStudent(employee);

    HttpHeaders headers = new HttpHeaders();
    return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
}

*/	  

/*
@RequestMapping(value = "/students", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
public ResponseEntity<String> createEmployee(@RequestBody Student student) 
{
is.addStudent(student);
return new ResponseEntity<String>(HttpStatus.CREATED);
}

*/