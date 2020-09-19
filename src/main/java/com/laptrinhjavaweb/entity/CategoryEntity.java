package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity {

	@Column(name = "name", unique = true, nullable = false)
	private String name;

	@Column(name = "code", unique = true, nullable = false)
	private String code;

	@OneToMany(mappedBy = "category")
	private List<NewEntity> listNew = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<NewEntity> getListNew() {
		return listNew;
	}

	public void setListNew(List<NewEntity> listNew) {
		this.listNew = listNew;
	}

}
