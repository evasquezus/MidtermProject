package com.skillsdistillery.midterm.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class UserEvent {

	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "date_created")
	private Date dateCreated;
	
	@Column(name = "event_rating")
	private int eventRating;
	
	@Column(name = "flag_content")
	private boolean flagContent;
	
	@Column(name = "active")
	private boolean active;
	
	@Column(name = "host_rating")
	private int hostRating;
	
	@Column(name = "event_id")
	private int eventId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getEventRating() {
		return eventRating;
	}

	public void setEventRating(int eventRating) {
		this.eventRating = eventRating;
	}

	public boolean isFlagContent() {
		return flagContent;
	}

	public void setFlagContent(boolean flagContent) {
		this.flagContent = flagContent;
	}

	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}

	public int getHostRating() {
		return hostRating;
	}

	public void setHostRating(int hostRating) {
		this.hostRating = hostRating;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public UserEvent() {
		super();
	}
	
	@Override
	public String toString() {
		return "UserEvent [id=" + id + ", userId=" + userId + ", dateCreated=" + dateCreated + ", eventRating="
				+ eventRating + ", flagContent=" + flagContent + ", active=" + active + ", hostRating=" + hostRating
				+ ", eventId=" + eventId + "]";
	}
	
	
}
