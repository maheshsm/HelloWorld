package com.cybage.resourcemanagement.dao;

import java.util.List;

import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.model.Project;
import com.cybage.resourcemanagement.model.ResourceProjectTable;
import com.cybage.resourcemanagement.model.RoleTable;

public interface IEmployeeDao 
{
	
	public Integer getEmployee(String username, String password);
	
	public Employee searchEmployee(int rollno);
	
	public Integer addEmployee(Employee employee); 
	
	public List<Employee> listEmployee();
	
	public List<Project> listProjects() ;
	
	public List<RoleTable> listRoles() ;
	
	public List<Object> listAllResources(String projName);
}
