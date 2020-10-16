package com.zr.poplar.pojo;

import java.io.Serializable;
/**
 * 
 * 管理员实体类
 *
 */
public class Root implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer rootId ;       //管理员id
	private String  rootName ;     // 管理员账号
	private String  rootPassword ; // 管理员密码
	
	public Root() {
		// TODO Auto-generated constructor stub
	}

	public Root(Integer rootId, String rootName, String rootPassword) {
		super();
		this.rootId = rootId;
		this.rootName = rootName;
		this.rootPassword = rootPassword;
	}

	public Integer getRootId() {
		return rootId;
	}

	public void setRootId(Integer rootId) {
		this.rootId = rootId;
	}

	public String getRootName() {
		return rootName;
	}

	public void setRootName(String rootName) {
		this.rootName = rootName;
	}

	public String getRootPassword() {
		return rootPassword;
	}

	public void setRootPassword(String rootPassword) {
		this.rootPassword = rootPassword;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rootId == null) ? 0 : rootId.hashCode());
		result = prime * result + ((rootName == null) ? 0 : rootName.hashCode());
		result = prime * result + ((rootPassword == null) ? 0 : rootPassword.hashCode());
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
		Root other = (Root) obj;
		if (rootId == null) {
			if (other.rootId != null)
				return false;
		} else if (!rootId.equals(other.rootId))
			return false;
		if (rootName == null) {
			if (other.rootName != null)
				return false;
		} else if (!rootName.equals(other.rootName))
			return false;
		if (rootPassword == null) {
			if (other.rootPassword != null)
				return false;
		} else if (!rootPassword.equals(other.rootPassword))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Root [rootId=" + rootId + ", rootName=" + rootName + ", rootPassword=" + rootPassword + "]";
	}
	
	

}
