package com.skillsdistillery.midterm.entities;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String email;

	private int phone;

	@Column(name = "image_url")
	private String imageUrl;

	private String password;

	private Boolean active;

	@CreationTimestamp
	@Column(name = "date_created")
	private Date dateCreated;
	
	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@OneToOne
	@JoinColumn(name = "role_id")
	private Role role;
	
	@OneToMany(mappedBy="user")
	  private List<Event> eventList;
	
	@OneToMany(mappedBy="user")
	  private List<UserEvent> userEventList;
	
	@OneToMany(mappedBy="user")
	  private List<EventSubject> eventSubjectList;


	public List<Event> getEventList() {
		return eventList;
	}

	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}

	public List<UserEvent> getUserEventList() {
		return userEventList;
	}

	public void setUserEventList(List<UserEvent> userEventList) {
		this.userEventList = userEventList;
	}

	public List<EventSubject> getEventSubjectList() {
		return eventSubjectList;
	}

	public void setEventSubjectList(List<EventSubject> eventSubjectList) {
		this.eventSubjectList = eventSubjectList;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", phone=" + phone + ", imageUrl=" + imageUrl + ", password=" + password + ", active=" + active
				+ ", dateCreated=" + dateCreated + ", address=" + address + ", role=" + role + "]";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

}
