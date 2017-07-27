package cn.shiyun.entity;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 2724888087391664167L;

	private String name;
	private String password;
	private String desc;
	private boolean enabled;
	private String role;
	private String oldRole;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getOldRole() {
		return oldRole;
	}
	public void setOldRole(String oldRole) {
		this.oldRole = oldRole;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
