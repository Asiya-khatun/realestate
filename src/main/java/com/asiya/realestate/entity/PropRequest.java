package com.asiya.realestate.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import com.asiya.realestate.enums.Status;


@Entity
@Table(name="prop_request")
public class PropRequest  implements Serializable{
	
	private static final long serialVersionUID=1l;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="req_id")
	private int req_id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private Users user;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="property_id")
	private Property Property;
	
	@Column(name="Request_date")
	private LocalDate req_Date;
	
	@Enumerated(EnumType.STRING)
	@Column(name="status")
	private Status status;
	

	public PropRequest() {
		super();
	}

	public PropRequest(int req_id, Users user, Property property, LocalDate req_Date,Status status) {
		super();
		this.req_id = req_id;
		this.user = user;
		this.Property = property;
		this.req_Date = req_Date;
		this.status=status;
		
	}

	public int getReq_id() {
		return req_id;
	}

	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Property getProperty() {
		return Property;
	}

	public void setProperty(Property property) {
		Property = property;
	}

	public LocalDate getReq_Date() {
		return req_Date;
	}

	public void setReq_Date(LocalDate req_Date) {
		this.req_Date = req_Date;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	
	
	
	

}
