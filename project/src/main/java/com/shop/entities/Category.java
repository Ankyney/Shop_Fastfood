package com.shop.entities;
// default package
// Generated Jun 29, 2017 8:24:48 PM by Hibernate Tools 5.2.3.Final

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

/**
 * Category generated by hbm2java
 */
@Entity
@Table(name = "category")
public class Category implements java.io.Serializable {

	private static final long serialVersionUID = 2877821560819176721L;
	
	@Id
  @GeneratedValue(strategy = IDENTITY)
  @Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "name", nullable = false, length = 50)
	@NotBlank
	private String name;
	@NotBlank
	private String description;
	
	
	public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

	public Category() {
	}

	public Category(String name) {
		this.name = name;
	}

	
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

  @Override
  public String toString() {
    return "Category [id=" + id + ", name=" + name + ", description=" + description + "]";
  }

}
