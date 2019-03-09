package com.skilldistillery.midterm.data;

import javax.servlet.http.HttpSession;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.User;

public interface MidtermMockDAO {

	public Event createEvent(Event event);

	public User createUser(User user);

	boolean destroyEvent(Event eventId, int id);

	boolean destroyUser(User user, int id);

	boolean editEvent(Event eventID, int id);
	
	public User findUserByEmailAndPassword(String email, String password); // added by todd
	
	public User loginUser(HttpSession httpSession, String email, String lastName); //added by todd

}
