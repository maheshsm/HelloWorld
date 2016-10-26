package com.cybage.resourcemanagement.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cybage.resourcemanagement.model.Employee;
import com.cybage.resourcemanagement.model.Project;
import com.cybage.resourcemanagement.model.ResourceProjectTable;
import com.cybage.resourcemanagement.model.RoleTable;


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

	public Integer getEmployee(String username, String password) 
	{
		session =  sessionFactory.getCurrentSession();
		System.out.println(username+""+password);
		String hql = "from employee where employee.username = 'username' and employee.password = 'password'";
		Query query = session.createQuery(hql);
		int id = query.executeUpdate();
		System.out.println("Record Updated : "+id);
		return id;
	}

	public Employee searchEmployee(int rollno)
	{
		session = sessionFactory.getCurrentSession();

		Employee s = (Employee) session.get(Employee.class, rollno);
		return s;
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

	public List<Project> listProjects() 
	{
		session = sessionFactory.getCurrentSession();
		System.out.println("In List Projects");
		
		List<Project> projectLlist = session.createQuery("from Project").list();
		System.out.println("Project List"+projectLlist);	
		return projectLlist;
	}

	public List<RoleTable> listRoles() 
	{
		session = sessionFactory.getCurrentSession();

		List<RoleTable> roleList = session.createQuery("select distinct r from RoleTable r").list();
		
		
		
		return roleList;
	}

	public List<Object> listAllResources(String projName)
	{
		session = sessionFactory.getCurrentSession();
		
		List<Object> list1= session.createQuery
		        (" select e.empid,e.department,e.desigination,e.ename,rp.billing,rp.start_date,rp.end_date,rtbl.role from ResourceProjectTable rp inner join rp.employee e inner join rp.projectTable p, RoleTable rtbl where p.proj_name=:projName and rtbl.employee.empid=rp.employee.empid")
		          .setParameter("projName", "CDAC") 
					.list();
		System.out.println(list1);
		return list1;
	}
	
	/*
	 * List<Object[]> list1= session.createQuery
        (" select e,rp from ResourceProjectTable rp inner join rp.employee e inner join rp.projectTable p, RoleTable rtbl where p.proj_name=:projName and rtbl.role=:role ")
          .setParameter("projName", "ResourceManagement") 
          .setParameter("role", "Dev")
			.list();
	 */
	

}
