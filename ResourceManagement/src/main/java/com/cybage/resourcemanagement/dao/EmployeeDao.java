package com.cybage.resourcemanagement.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cybage.resourcemanagement.model.Employee;


@Repository("empDAO")
public class EmployeeDao implements IEmployeeDao 
{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session	session;
	
	public EmployeeDao()
	{
		System.out.println("In Dao Default constr . . .");
	}

	public Integer addEmployee(Employee employee) 
	{
		Integer id = (Integer) sessionFactory.getCurrentSession().save(employee);
		System.out.println("Object Saved");
		return id;	
	}
	
	public List<Employee> listEmployee() 
	{
		 session = sessionFactory.getCurrentSession();
		
		List<Employee> personsList = session.createQuery("from Employee").list();
		
		return personsList;
	}
	
	public Employee searchEmployee(int rollno)
	{
		 session = sessionFactory.getCurrentSession();
		
		 Employee s = (Employee) session.get(Employee.class, rollno);
		 return s;
	}
}
