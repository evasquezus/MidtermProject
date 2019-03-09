package com.skilldistillery.midterm.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@CreationTimestamp
	@Column(name = "start_time")
	private Date startTime;

	@CreationTimestamp
	@Column(name = "finish_time")
	private Date finishTime;

	@Column(name = "image_url")
	private String imageUrl;

	private boolean open;

	@Column(name = "max_size")
	private int maxSize;

	private boolean rideShare;

	@Column(name = "date_created")
	private Date dateCreated;

	private boolean active;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user; // can be changed as ownerUser ?

	@OneToMany(mappedBy = "event")
	private List<UserEvent> userevents;

	@ManyToOne
	@JoinColumn(name = "event_subject_id")
	private EventSubject eventSubject;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;	
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public EventSubject getEventSubject() {
		return eventSubject;
	}

	public void setEventSubject(EventSubject eventSubject) {
		this.eventSubject = eventSubject;
	}


	public List<UserEvent> getUserevents() {
		return userevents;
	}

	public void setUserevents(List<UserEvent> userevents) {
		this.userevents = userevents;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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


	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}



	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public int getMaxSize() {
		return maxSize;
	}

	public void setMaxSize(int maxSize) {
		this.maxSize = maxSize;
	}

	public boolean isRideShare() {
		return rideShare;
	}

	public void setRideShare(boolean rideShare) {
		this.rideShare = rideShare;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + ", description=" + description + ", startTime=" + startTime
				+ ", finishTime=" + finishTime + ", imageUrl=" + imageUrl + ", open=" + open + ", maxSize=" + maxSize
				+ ", rideShare=" + rideShare + ", dateCreated=" + dateCreated + ", active=" + active + ", user=" + user
				+ ", userevents=" + userevents + ", eventSubject=" + eventSubject + ", address=" + address + "]";
	}


}
