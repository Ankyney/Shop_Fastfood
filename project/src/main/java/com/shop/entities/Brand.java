package com.shop.entities;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "brand")
public class Brand implements java.io.Serializable {
  

  /**
   * 
   */
  private static final long serialVersionUID = -8517480979294689232L;
  

  @Id
  @GeneratedValue(strategy = IDENTITY)
  @Column(name = "id", unique = true, nullable = false)
  private Long id;
  @NotBlank(message = "Tên thương hiểu không được để trống")
	@Length(max = 50, message = "Tên sản phẩm không được quá 50 ký tự .")
	
  private String name;
  @NotBlank(message = "Mô tả không được để trống")
	@Length(max = 255, message = "Tên sản phẩm không được quá 50 ký tự .")
	
  private String description;
  
  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }
  @Override
  public String toString() {
    return "Brand [id=" + id + ", name=" + name + ", description=" + description + "]";
  }
  
  
}
