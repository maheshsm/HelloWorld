package com.cybage.resourcemanagement.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the employee database table.
 * 
 */
@Entity
@NamedQuery(name="Employee.findAll", query="SELECT e FROM Employee e")
public class Employee  {
	@Override
	public String toString() {
		return "Employee [empid=" + empid + ", department=" + department + ", desigination=" + desigination + ", ename="
				+ ename + "]";
	}

	private static final long serialVersionUID = 1L;
	private int empid;
	private String department;
	private String desigination;
	private String ename;
	private List<ResourceProjectTable> resourceProjectTables;
	private List<RoleTable> roleTables;
	private List<SudoRoleTable> sudoRoleTables;
	private List<TeamEmpidTable> teamEmpidTables;

	public Employee() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getEmpid() {
		return this.empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}


	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}


	public String getDesigination() {
		return this.desigination;
	}

	public void setDesigination(String desigination) {
		this.desigination = desigination;
	}


	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}


	/*//bi-directional many-to-one association to ResourceProjectTable
	@OneToMany(mappedBy="employee", cascade={CascadeType.ALL})
	public List<ResourceProjectTable> getResourceProjectTables() {
		return this.resourceProjectTables;
	}

	public void setResourceProjectTables(List<ResourceProjectTable> resourceProjectTables) {
		this.resourceProjectTables = resourceProjectTables;
	}

	public ResourceProjectTable addResourceProjectTable(ResourceProjectTable resourceProjectTable) {
		getResourceProjectTables().add(resourceProjectTable);
		resourceProjectTable.setEmployee(this);

		return resourceProjectTable;
	}

	public ResourceProjectTable removeResourceProjectTable(ResourceProjectTable resourceProjectTable) {
		getResourceProjectTables().remove(resourceProjectTable);
		resourceProjectTable.setEmployee(null);

		return resourceProjectTable;
	}


	//bi-directional many-to-one association to RoleTable
	@OneToMany(mappedBy="employee")
	public List<RoleTable> getRoleTables() {
		return this.roleTables;
	}

	public void setRoleTables(List<RoleTable> roleTables) {
		this.roleTables = roleTables;
	}

	public RoleTable addRoleTable(RoleTable roleTable) {
		getRoleTables().add(roleTable);
		roleTable.setEmployee(this);

		return roleTable;
	}

	public RoleTable removeRoleTable(RoleTable roleTable) {
		getRoleTables().remove(roleTable);
		roleTable.setEmployee(null);

		return roleTable;
	}


	//bi-directional many-to-one association to SudoRoleTable
	@OneToMany(mappedBy="employee")
	public List<SudoRoleTable> getSudoRoleTables() {
		return this.sudoRoleTables;
	}

	public void setSudoRoleTables(List<SudoRoleTable> sudoRoleTables) {
		this.sudoRoleTables = sudoRoleTables;
	}

	public SudoRoleTable addSudoRoleTable(SudoRoleTable sudoRoleTable) {
		getSudoRoleTables().add(sudoRoleTable);
		sudoRoleTable.setEmployee(this);

		return sudoRoleTable;
	}

	public SudoRoleTable removeSudoRoleTable(SudoRoleTable sudoRoleTable) {
		getSudoRoleTables().remove(sudoRoleTable);
		sudoRoleTable.setEmployee(null);

		return sudoRoleTable;
	}


	//bi-directional many-to-one association to TeamEmpidTable
	@OneToMany(mappedBy="employee")
	public List<TeamEmpidTable> getTeamEmpidTables() {
		return this.teamEmpidTables;
	}

	public void setTeamEmpidTables(List<TeamEmpidTable> teamEmpidTables) {
		this.teamEmpidTables = teamEmpidTables;
	}

	public TeamEmpidTable addTeamEmpidTable(TeamEmpidTable teamEmpidTable) {
		getTeamEmpidTables().add(teamEmpidTable);
		teamEmpidTable.setEmployee(this);

		return teamEmpidTable;
	}

	public TeamEmpidTable removeTeamEmpidTable(TeamEmpidTable teamEmpidTable) {
		getTeamEmpidTables().remove(teamEmpidTable);
		teamEmpidTable.setEmployee(null);

		return teamEmpidTable;
	}*/

}