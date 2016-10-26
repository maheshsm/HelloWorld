package com.cybage.resourcemanagement.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the resource_project_table database table.
 * 
 */
@Entity
@Table(name="resource_project_table")
@NamedQuery(name="ResourceProjectTable.findAll", query="SELECT r FROM ResourceProjectTable r")
public class ResourceProjectTable  {
	private static final long serialVersionUID = 1L;
	private int RP_id;
	private float billing;
	private Date end_date;
	private Date start_date;
	private Employee employee;
	private Project projectTable;

	public ResourceProjectTable() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getRP_id() {
		return this.RP_id;
	}

	public void setRP_id(int RP_id) {
		this.RP_id = RP_id;
	}


	public float getBilling() {
		return this.billing;
	}

	public void setBilling(float billing) {
		this.billing = billing;
	}


	@Temporal(TemporalType.DATE)
	public Date getEnd_date() {
		return this.end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	@Temporal(TemporalType.DATE)
	public Date getStart_date() {
		return this.start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	//bi-directional many-to-one association to Employee
	@ManyToOne(cascade={CascadeType.ALL}, fetch=FetchType.LAZY)
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


	@Override
	public String toString() {
		return "ResourceProjectTable [RP_id=" + RP_id + ", billing=" + billing + ", end_date=" + end_date
				+ ", start_date=" + start_date + ", employee=" + employee + ", projectTable=" + projectTable + "]";
	}

	
}