package com.asiya.realestate.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Role_Table")
public class UserRole implements Serializable {
	private static final long SerialVersionUID=1l;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="role_id")
	private int id;
	
	@Column(name="role")
	private String role;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private Users user;
	
	public UserRole() {
		super();
	}
	

	public UserRole(int id, String role, Users user) {
		super();
		this.id = id;
		this.role = role;
		this.user = user;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}

	
	
	

}
