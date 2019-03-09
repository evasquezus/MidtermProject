package com.skillsdistillery.midterm.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "apartment")
	private String apartment;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "state")
	@Enumerated(EnumType.STRING)
	private State state;
	
	@Column(name = "state_abbreviation")
	private String stateAbbreviation;
	
	@Column(name = "zip_code")
	private int zipcode;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name="date_created")
	@CreationTimestamp
	private Date dateCreated;
	
	@OneToOne(mappedBy="address")
	private User user;

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getApartment() {
		return apartment;
	}

	public void setApartment(String apartment) {
		this.apartment = apartment;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}



	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", apartment=" + apartment + ", city=" + city + ", state="
				+ state + ", stateAbbreviation=" + stateAbbreviation + ", zipcode=" + zipcode + ", dateCreated="
				+ dateCreated + ", user=" + user + "]";
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public String getStateAbbreviation() {
		return stateAbbreviation;
	}

	public void setStateAbbreviation(String stateAbbreviation) {
		this.stateAbbreviation = stateAbbreviation;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}


	public Address() {
		super();
	}

	
	
	
}
