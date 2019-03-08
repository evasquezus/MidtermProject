package com.skillsdistillery.midtermproject.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Event {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "name")
	private String name;
	

	@Column(name = "description")
	private String description;
	
	@Column(name = "event_type_id")
	private String eventTypeId;
	
	@Column(name = "start_time")
	private  Date startTime;
	
	@Column(name = "finish_time")
	private Date finishTime;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	@Column(name = "address_id")
	private int addressID;
	
	@Column(name = "open")
	private boolean open;
	
	@Column(name = "max_size")
	private int maxSize;
	
	@Column(name = "rideshare")
	private boolean rideShare;
	
	@Column(name = "owner_id")
	private int customerId;
	
	@Column(name = "date_created")
	private Date dateCreated;
	
	@Column(name = "active")
	private boolean active;

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

	public String getEventTypeId() {
		return eventTypeId;
	}

	public void setEventTypeId(String eventTypeId) {
		this.eventTypeId = eventTypeId;
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

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
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

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
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
	
	public Event() {
		super();
	}
	
	@Override
	public String toString() {
		return "Event [id=" + id + ", name=" + name + ", description=" + description + ", eventTypeId=" + eventTypeId
				+ ", startTime=" + startTime + ", finishTime=" + finishTime + ", imageUrl=" + imageUrl + ", addressID="
				+ addressID + ", open=" + open + ", maxSize=" + maxSize + ", rideShare=" + rideShare + ", customerId="
				+ customerId + ", dateCreated=" + dateCreated + ", active=" + active + "]";
	}
}
