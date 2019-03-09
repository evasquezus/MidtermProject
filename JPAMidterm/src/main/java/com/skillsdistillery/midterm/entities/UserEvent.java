package com.skillsdistillery.midterm.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserEvent {

	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	@Id
	private int id;
	
//	@Column(name = "user_id")
//	private int userId;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

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

	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;
	
	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public UserEvent() {
		super();
	}
	
	@Override
	public String toString() {
		return "UserEvent [id=" + id + ", dateCreated=" + dateCreated + ", eventRating=" + eventRating
				+ ", flagContent=" + flagContent + ", active=" + active + ", hostRating=" + hostRating + ", user="
				+ user + ", event=" + event + "]";
	}
	
	
}
