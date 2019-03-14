package com.skilldistillery.midterm.data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;
import com.skilldistillery.midterm.entities.User;
import com.skilldistillery.midterm.entities.UserEvent;

@Transactional
@Service
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<EventSubject> findAllEventSubjects() {
		String query = "SELECT es FROM EventSubject es";

		List<EventSubject> results = em.createQuery(query, EventSubject.class).getResultList();

		return results;
	}

	// Method for creating user
	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	// Method for deleting user
	@Override
	public boolean destroyUser(Integer id) {
		User toBeDeleted = em.find(User.class, id);
		toBeDeleted.setActive(false);
		em.flush();
		System.out.println(toBeDeleted.getId());
		Boolean result = !em.contains(toBeDeleted);
		return result;
	}

	// Method for creating event
	@Override
	public Event createEvent(int userId, Event event, Address address, EventSubject eventSubject) {
		User userAddEventTo = em.find(User.class, userId);

		eventSubject.setUser(userAddEventTo);
		event.setEventSubject(eventSubject);
		event.setUser(userAddEventTo);
		event.setAddress(address);
		event.setDateCreated(new Date());
		
		UserEvent userevent = new UserEvent(new Date(),null, false, true, null, userAddEventTo, event );
		em.persist(userevent);
		em.persist(event);
		em.flush();
		return event;
	}

	// Method for deleting event

	@Override
	public boolean destroyEvent(Event eventID, int id) {
		Event toBeDeleted = em.find(Event.class, id);
		toBeDeleted.setActive(false);
		em.flush();
		Boolean result = !em.contains(toBeDeleted);
		return result;
	}

	// Method for editing an event
	@Override
	public boolean editEvent(int id, Event eventID) {
		Event toBeEdited = em.find(Event.class, id);
		System.out.println(toBeEdited.getId());
		return false;
	}

	@Override
	public User findUserByEmail(String email) {

		User user = null;

		if (email != null) {

			String query = "SELECT u FROM User u WHERE u.email = :email";

			user = em.createQuery(query, User.class).setParameter("email", email).getSingleResult();

		}

		return user;

	}

	@Override
	public User getSessionUser(HttpSession session) {

		User user = null;

		if (session.getId() != null) {

		} else {

		}

		return user;

	}

	@Override
	public User updateUser(User user, Integer id) {
		User toBeUpdated = em.find(User.class, id);
		toBeUpdated.setFirstName(user.getFirstName());
		toBeUpdated.setLastName(user.getLastName());
		toBeUpdated.setEmail(user.getEmail());
		toBeUpdated.setPhone(user.getPhone());
		em.persist(toBeUpdated);
		em.flush();
		return toBeUpdated;

	}

	@Override
	public List<Event> findEventsForFrontPage() {

		String query = "SELECT e FROM Event e";

		List<Event> results = em.createQuery(query, Event.class).getResultList();

		return results;
	}

	@Override
	public List<Event> findUserEvents(int userId) {

		String query = "Select e FROM Event e WHERE user.id  = :id ORDER BY e.dateCreated DESC";
		List<Event> results = em.createQuery(query, Event.class).setParameter("id", userId).getResultList();

		return results;
	}

	@Override
	public Event findEventById(int eventId) {
		Event event = em.find(Event.class, eventId);
		return event;
	}

	@Override
	public UserEvent addUsertoEventUser(Integer userId, Integer eventId) {
		Event userEvent = em.find(Event.class, eventId);
		User addUserToEvent = em.find(User.class, userId);
		UserEvent addCurrentUserToUserEvent = new UserEvent(new Date(),null, false, true, null, addUserToEvent, userEvent );
		em.persist(addCurrentUserToUserEvent);
		em.flush();
		return addCurrentUserToUserEvent;
	}

	// Method for adding user to an event

//	public User addUserToEvent(User userToBeAdded, Event eventId, int id) {
//		User addUserToEvent = em.find(User.class, id);
//		Event eventToBeAttended = em.find(Event.class, eventId);
//		eventToBeAttended.getMaxSize();
//		eventToBeAttended.getDescription();
//		addUserToEvent.getFirstName();
//		addUserToEvent.getLastName();
//		addUserToEvent.getImageUrl();
//		addUserToEvent.getPhone();
//		eventToBeAttended.setCustomerId(addUserToEvent.getId());
//		return null;
//
//	}

}
