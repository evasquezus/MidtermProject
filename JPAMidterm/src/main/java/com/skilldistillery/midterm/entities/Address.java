package com.skilldistillery.midterm.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	private String address;
	
	private String apartment;
	
	private String city;
	
	private String state;

	@Column(name = "state_abbreviation")
	private String stateAbbreviation;
	
	@Column(name = "zip_code")
	private int zipcode;

	@Column(name="date_created")
	@CreationTimestamp
	private Date dateCreated;
	
	@OneToOne(mappedBy="address")
	private User user;
	
	@OneToMany(mappedBy ="address")
	private List<Event> events;
	
	public Address() {}



	public Address(String address, String city, String state, int zipcode) {
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
	}



	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
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
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}



	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", apartment=" + apartment + ", city=" + city + ", state="
				+ state + ", stateAbbreviation=" + stateAbbreviation + ", zipcode=" + zipcode + ", dateCreated="
				+ dateCreated + ", user=" + user + ", events=" + events + "]";
	}

	
	
}
