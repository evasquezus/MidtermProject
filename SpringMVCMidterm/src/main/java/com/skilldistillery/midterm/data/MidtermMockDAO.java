package com.skilldistillery.midterm.data;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.User;

public interface MidtermMockDAO {

	public Event createEvent(Event event);

	public User createUser(User user);

	boolean destroyEvent(Event eventId, int id);

	boolean destroyUser(User user, int id);

	boolean editEvent(Event eventID, int id);

}
