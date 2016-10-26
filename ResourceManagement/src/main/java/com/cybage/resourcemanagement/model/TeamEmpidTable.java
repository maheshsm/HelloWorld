package com.cybage.resourcemanagement.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the team_empid_table database table.
 * 
 */
@Entity
@Table(name="team_empid_table")
@NamedQuery(name="TeamEmpidTable.findAll", query="SELECT t FROM TeamEmpidTable t")
public class TeamEmpidTable  {
	@Override
	public String toString() {
		return "TeamEmpidTable [TEid=" + TEid + ", end_date=" + end_date + ", start_date=" + start_date + "]";
	}

	private static final long serialVersionUID = 1L;
	private int TEid;
	private Date end_date;
	private Date start_date;
	private Employee employee;
	private Project projectTable;
	private TeamTable teamTable;

	public TeamEmpidTable() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getTEid() {
		return this.TEid;
	}

	public void setTEid(int TEid) {
		this.TEid = TEid;
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


	//bi-directional many-to-one association to TeamTable
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="Tid")
	public TeamTable getTeamTable() {
		return this.teamTable;
	}

	public void setTeamTable(TeamTable teamTable) {
		this.teamTable = teamTable;
	}

}