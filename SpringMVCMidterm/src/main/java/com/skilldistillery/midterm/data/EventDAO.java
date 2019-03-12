package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;
import com.skilldistillery.midterm.entities.User;

public interface EventDAO {

	public Event createEvent(int userId, Event event, Address address, EventSubject eventSubject);
	
	public List<EventSubject> findAllEventSubjects();
	
	public List<Event> findEventsForFrontPage();

	public User createUser(User user);

	boolean destroyEvent(Event eventId, int id);

	boolean destroyUser(User user, int id);

	boolean editEvent(Event eventID, int id);
	
	public User findUserByEmail(String email);
	
	public User updateUser(User user, Integer id);
	
}
