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
import javax.persistence.Table;

@Entity
@Table(name="user_event")
public class UserEvent {	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "date_created")
	private Date dateCreated;
	
	@Column(name = "event_rating")
	private Integer eventRating;
	
	@Column(name = "flag_content")
	private boolean flagContent;
	
	private boolean active;
	
	@Column(name = "host_rating")
	private Integer hostRating;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;
	
	@OneToMany(mappedBy = "userEvent")
	private List<Comment> comments;

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUser() {
		return user;
	}
	public UserEvent() {
		
	}
	public UserEvent(Date dateCreated, Integer eventRating, boolean flagContent, boolean active, Integer hostRating, User user,
			Event event) {
		this.dateCreated = dateCreated;
		this.eventRating = eventRating;
		this.flagContent = flagContent;
		this.active = active;
		this.hostRating = hostRating;
		this.user = user;
		this.event = event;
	}

	public void setUser(User user) {
		this.user = user;
	}

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

	public void setEventRating(Integer eventRating) {
		this.eventRating = eventRating;
	}

	public void setHostRating(Integer hostRating) {
		this.hostRating = hostRating;
	}
	
}
