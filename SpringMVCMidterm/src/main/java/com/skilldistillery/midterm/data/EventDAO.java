package com.skilldistillery.midterm.data;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;
import com.skilldistillery.midterm.entities.User;

public interface EventDAO {

	public Event createEvent(int userId, Event event, Address address, EventSubject eventSubject);
	public List<EventSubject> findAllEventSubjects();

	public User createUser(User user);

	boolean destroyEvent(Event eventId, int id);

	boolean destroyUser(User user, int id);

	boolean editEvent(Event eventID, int id);
	
	public User findUserByEmailAndPassword(String email, String password); // added by todd
	
	public User loginUser(HttpSession httpSession, String email, String lastName); //added by todd

}
