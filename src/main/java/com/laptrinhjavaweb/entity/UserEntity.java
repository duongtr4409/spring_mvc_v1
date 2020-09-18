package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

	@Column(name = "username", nullable = false, unique = true)
	private String userName;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "fullname", nullable = false)
	private String fullName;

	@Column(name = "status", nullable = false, length = 1)
	private Integer status;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userID"), inverseJoinColumns = @JoinColumn(name = "roleID"))
	private List<RoleEntity> listRole = new ArrayList<>();

	public UserEntity() {
		super();
	}

	public UserEntity(Long id, String createBy, Date createdDate, String modifyBy, Date modifiedDate) {
		super(id, createBy, createdDate, modifyBy, modifiedDate);
	}

	public UserEntity(Long id, String createBy, Date createdDate, String modifyBy, Date modifiedDate, String userName,
			String password, String fullName, Integer status, List<RoleEntity> listRole) {
		super(id, createBy, createdDate, modifyBy, modifiedDate);
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.status = status;
		this.listRole = listRole;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public List<RoleEntity> getListRole() {
		return listRole;
	}

	public void setListRole(List<RoleEntity> listRole) {
		this.listRole = listRole;
	}

	@Override
	public String toString() {
		return "UserEntity [userName=" + userName + ", password=" + password + ", fullName=" + fullName + ", status="
				+ status + ", listRole=" + listRole + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((fullName == null) ? 0 : fullName.hashCode());
		result = prime * result + ((listRole == null) ? 0 : listRole.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserEntity other = (UserEntity) obj;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		if (listRole == null) {
			if (other.listRole != null)
				return false;
		} else if (!listRole.equals(other.listRole))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}

}
