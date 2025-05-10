package com.asiya.realestate.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
@Entity
@Table(name="requested")
public class Requested implements Serializable {
	private static final long SerialVersionUID=1l;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="requested_id")
	private int id;
	
	@OneToOne
	@JoinColumn(name="req_id")
	private PropRequest propRequest;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Users users;
	
	@ManyToOne
	@JoinColumn(name="property_id")
	private Property property;

	public Requested() {
		super();
	}

	public Requested(int id, PropRequest propRequest, Users users, Property property) {
		super();
		this.id = id;
		this.propRequest = propRequest;
		this.users = users;
		this.property = property;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PropRequest getPropRequest() {
		return propRequest;
	}

	public void setPropRequest(PropRequest propRequest) {
		this.propRequest = propRequest;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}
	
	
	

}
