package com.zr.poplar.pojo;

import java.io.Serializable;
/**
 * 
 * 员工实体类
 *
 */
public class Emp implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer empId ;       //员工id
	private Integer  empNumber ;   //员工编号
	private String empName ;     //员工账号
	private String empPassword ; //账号密码
	
	public Emp() {
		// TODO Auto-generated constructor stub
	}

	public Emp(Integer empId, Integer empNumber, String empName, String empPassword) {
		super();
		this.empId = empId;
		this.empNumber = empNumber;
		this.empName = empName;
		this.empPassword = empPassword;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public Integer getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(Integer empNumber) {
		this.empNumber = empNumber;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((empId == null) ? 0 : empId.hashCode());
		result = prime * result + ((empName == null) ? 0 : empName.hashCode());
		result = prime * result + ((empNumber == null) ? 0 : empNumber.hashCode());
		result = prime * result + ((empPassword == null) ? 0 : empPassword.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Emp other = (Emp) obj;
		if (empId == null) {
			if (other.empId != null)
				return false;
		} else if (!empId.equals(other.empId))
			return false;
		if (empName == null) {
			if (other.empName != null)
				return false;
		} else if (!empName.equals(other.empName))
			return false;
		if (empNumber == null) {
			if (other.empNumber != null)
				return false;
		} else if (!empNumber.equals(other.empNumber))
			return false;
		if (empPassword == null) {
			if (other.empPassword != null)
				return false;
		} else if (!empPassword.equals(other.empPassword))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empNumber=" + empNumber + ", empName=" + empName + ", empPassword="
				+ empPassword + "]";
	}

	
	 
	
}
