package com.cybage.resourcemanagement.dao;

import java.util.List;

import com.cybage.resourcemanagement.model.Employee;

public interface IEmployeeDao 
{
	
	public Integer addEmployee(Employee employee);
	
	public List<Employee> listEmployee();
	
	public Employee searchEmployee(int rollno);
}
