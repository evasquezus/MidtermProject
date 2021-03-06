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

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	private String body;
	
	@Column(name = "flag_content")
	private boolean flagContent;
	
	@Column(name = "date_created")
	private Date dateCreated;
		
	private boolean active;
	
	@ManyToOne
	@JoinColumn(name = "user_event_id")
	private UserEvent userEvent;
	
	@OneToMany(mappedBy ="comment")
	private List<Comment> replyComments;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to")
	private Comment comment; 
	
	public List<Comment> getReplyComments() {
		return replyComments;
	}

	public void setReplyComments(List<Comment> replyComments) {
		this.replyComments = replyComments;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public UserEvent getUserEvent() {
		return userEvent;
	}

	public void setUserEvent(UserEvent userEvent) {
		this.userEvent = userEvent;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public boolean isFlagContent() {
		return flagContent;
	}

	public void setFlagContent(boolean flagContent) {
		this.flagContent = flagContent;
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
		return "Comment [id=" + id + ", title=" + title + ", body=" + body + ", flagContent=" + flagContent
				+ ", dateCreated=" + dateCreated + ", active=" + active + ", userEvent=" + userEvent
				+ ", replyComments=" + replyComments + ", comment=" + comment + "]";
	}

	public Comment() {
		super();
	}
	
	
}
