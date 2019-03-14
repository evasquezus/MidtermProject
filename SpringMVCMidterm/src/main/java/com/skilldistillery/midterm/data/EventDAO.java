package com.skilldistillery.midterm.data;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;
import com.skilldistillery.midterm.entities.User;
import com.skilldistillery.midterm.entities.UserEvent;

public interface EventDAO {
	
	public Event findEventById(int eventId);
	
	public Event createEvent(int userId, Event event, Address address, EventSubject eventSubject);
	
	public List<Event> findUserEvents(int userId);
	
	public List<EventSubject> findAllEventSubjects();
	
	public List<Event> findEventsForFrontPage();

	public User createUser(User user);

	boolean destroyEvent(Event eventId, int id);

	boolean destroyUser(Integer id);

	boolean editEvent(int id, Event event);
	
	public User findUserByEmail(String email);
	
	public User getSessionUser(HttpSession session);
	
	public User updateUser(User user, Integer id);

	public UserEvent addUsertoEventUser(Integer userId, Integer eventId);
	public Boolean deleteEvent(int eventId);

	public Event saveEvent(Event event, int id);
	
}
