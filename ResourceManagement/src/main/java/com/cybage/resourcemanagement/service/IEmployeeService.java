package com.cybage.resourcemanagement.service;

import java.util.List;

import com.cybage.resourcemanagement.model.Employee;

public interface IEmployeeService 
{
	public Integer addEmployee(Employee employee);
	
	public List<Employee> listEmployee() ;
	
	public Employee searchEmployee(int rollno);
}
