package com.jamiegunia.soloproject.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class LoginUser {

	@NotBlank
	@Email(message = "Email must have format of xxx@xxx.com")
	private String email;

	@NotNull
	@NotBlank
	@Size(min = 8, max = 200, message = "password is required and must be at least 8 characters.")
	private String password;

	// constructor needed for data binding/model attribute to map object over form
	public LoginUser() {

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
	
	
}
