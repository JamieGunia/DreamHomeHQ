package com.jamiegunia.soloproject.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	
    @NotNull
    @NotBlank
    @Size(min = 3, max = 200, message="Name must be at least 3 characters.")
    private String name;
    
    
    @NotBlank
    @Email (message="Email must have format of xxx@xxx.com")
    private String email;
    
    @NotNull
    @NotBlank
    @Size(min = 8, max = 200, message="password is required and must be at least 8 characters.")
    private String password;
    
   
    //Transient only exists for validation and does not get added into the db
    @Transient
    @NotBlank
    @Size(min = 8, max = 200, message="password is required and must be at least 8 characters.")
    private String confirmPassword;
    

    
    
    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @OneToMany(mappedBy="dreamHomeCreator", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
    private List<House> myHouses;
    
 // Constructors
    public User() {
    	
    }

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<House> getMyHouses() {
		return myHouses;
	}

	public void setMyHouses(List<House> myHouses) {
		this.myHouses = myHouses;
	}
    
    

}
