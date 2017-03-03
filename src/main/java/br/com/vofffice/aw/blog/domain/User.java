package br.com.vofffice.aw.blog.domain;

import java.util.Date;

public class User {
	
	private Long id;
	private String fullName;
	private String username;
	private String password;
	private Date createdAt;
	private Date updatedAt;
	
	public User(){}
	
	public User(Long id) {
		this.id = id;
	}

	public User(String fullName, String username, String password) {
		this.fullName = fullName;
		this.username = username;
		this.password = password;
	}

	public User(Long id, String fullName, String username, String password) {
		this.id = id;
		this.fullName = fullName;
		this.username = username;
		this.password = password;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	
	public Boolean verifyPassword(String password) {
		return this.password.equals(password);
	}
	
}
