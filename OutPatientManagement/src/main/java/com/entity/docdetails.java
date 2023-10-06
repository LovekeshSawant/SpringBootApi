package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="docdetails")
public class docdetails 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int did;
	private String dname;
	private String demail;
	private String dmonumber;
	private String dlocation;
	private String dqualification;
	private String dspecialization;
	private String password;
	public int getId() {
		return did;
	}
	public void setId(int id) {
		this.did = id;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDemail() {
		return demail;
	}
	public void setDemail(String demail) {
		this.demail = demail;
	}
	public String getDmonumber() {
		return dmonumber;
	}
	public void setDmonumber(String dmonumber) {
		this.dmonumber = dmonumber;
	}
	public String getDlocation() {
		return dlocation;
	}
	public void setDlocation(String dlocation) {
		this.dlocation = dlocation;
	}
	public String getDqualification() {
		return dqualification;
	}
	public void setDqualification(String dqualification) {
		this.dqualification = dqualification;
	}
	public String getDspecialization() {
		return dspecialization;
	}
	public void setDspecialization(String dspecialization) {
		this.dspecialization = dspecialization;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "docdetails [id=" + did + ", dname=" + dname + ", demail=" + demail + ", dmonumber=" + dmonumber
				+ ", dlocation=" + dlocation + ", dqualification=" + dqualification + ", dspecialization="
				+ dspecialization + ", password=" + password + "]";
	}
}
