package com.skillsdistillery.midterm.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="event_subject")
public class EventSubject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="event_name")
	private String eventName;
	
	@Column(name="img_url")
	private String imgUrl;
	
	@CreationTimestamp
	@Column(name="date_created")
	private Date dateCreated;
	
	@Column(name="flag_content")
	private Boolean flagContent;
	
	private Boolean active;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;


	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Boolean getFlagContent() {
		return flagContent;
	}

	public void setFlagContent(Boolean flagContent) {
		this.flagContent = flagContent;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		return "EventSubject [id=" + id + ", eventName=" + eventName + ", imgUrl=" + imgUrl + ", dateCreated="
				+ dateCreated + ", flagContent=" + flagContent + ", active=" + active + ", user=" + user + "]";
	}
	
	
}
