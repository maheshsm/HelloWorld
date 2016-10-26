package com.cybage.resourcemanagement.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the sudo_role_table database table.
 * 
 */
@Entity
@Table(name="sudo_role_table")
@NamedQuery(name="SudoRoleTable.findAll", query="SELECT s FROM SudoRoleTable s")
public class SudoRoleTable  {
	@Override
	public String toString() {
		return "SudoRoleTable [srole_id=" + srole_id + ", e_date=" + e_date + ", s_date=" + s_date + ", sudo_Role="
				+ sudo_Role + "]";
	}

	private static final long serialVersionUID = 1L;
	private int srole_id;
	private Date e_date;
	private Date s_date;
	private String sudo_Role;
	private Employee employee;

	public SudoRoleTable() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getSrole_id() {
		return this.srole_id;
	}

	public void setSrole_id(int srole_id) {
		this.srole_id = srole_id;
	}


	@Temporal(TemporalType.DATE)
	public Date getE_date() {
		return this.e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}


	@Temporal(TemporalType.DATE)
	public Date getS_date() {
		return this.s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}


	public String getSudo_Role() {
		return this.sudo_Role;
	}

	public void setSudo_Role(String sudo_Role) {
		this.sudo_Role = sudo_Role;
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

}