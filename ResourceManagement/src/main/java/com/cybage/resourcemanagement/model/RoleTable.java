package com.cybage.resourcemanagement.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the role_table database table.
 * 
 */
@Entity
@Table(name="role_table")
@NamedQuery(name="RoleTable.findAll", query="SELECT r FROM RoleTable r")
public class RoleTable  {
	private static final long serialVersionUID = 1L;
	private int role_id;
	private String role;
	private Employee employee;
	private Project projectTable;

	@Override
	public String toString() {
		return "RoleTable [role_id=" + role_id + ", role=" + role + ", employee=" + employee + "]";
	}


	public RoleTable() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getRole_id() {
		return this.role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}


	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	//bi-directional many-to-one association to Employee
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Empid")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	//bi-directional many-to-one association to Project
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Proj_id")
	public Project getProjectTable() {
		return this.projectTable;
	}

	public void setProjectTable(Project projectTable) {
		this.projectTable = projectTable;
	}

}