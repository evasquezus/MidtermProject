package com.skilldistillery.midterm.data;

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

@Transactional
@Service
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<EventSubject>  findAllEventSubjects() {
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
	public boolean destroyUser(User userID, int id) {
		User toBeDeleted = em.find(User.class, id);
		em.remove(toBeDeleted); // performs the delete on the managed entity
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
		em.persist(event);
		em.flush();
		return event;
	}

	// Method for deleting event

	@Override
	public boolean destroyEvent(Event eventID, int id) {
		Event toBeDeleted = em.find(Event.class, id);
		em.remove(toBeDeleted); // performs the delete on the managed entity
		em.getTransaction().commit();
		System.out.println(toBeDeleted.getId());
		Boolean result = !em.contains(toBeDeleted);
		return result;
	}

	// Method for editing an event
	@Override
	public boolean editEvent(Event eventID, int id) {
		Event toBeEdited = em.find(Event.class, id);
		System.out.println(toBeEdited.getId());
		return false;
	}

	@Override
	public User loginUser(HttpSession httpSession, String email, String password) {

		User user = findUserByEmailAndPassword(email, password);
		
		
		
		return user;
		
//		String sessionKey = "firstAccessTime";
//		Object time = httpSession.getAttribute(sessionKey);
//		if (time == null) {
//			time = LocalDateTime.now();
//			httpSession.setAttribute(sessionKey, time);
//		}
//		//return "first access time : " + time + "\nsession id: " + httpSession.getId();
//		return null;

	}

	@Override
	public User findUserByEmailAndPassword(String email, String password) {
		
		if (email != null && password != null) {
			
//			String queryString = "SELECT s.firstName, s.lastName FROM Staff s WHERE id < :val";
//			List<Object[]> results = em.createQuery(queryString, Object[].class).setParameter("val", val).getResultList();
			
			
			String query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";

			return em.createQuery(query, User.class).getSingleResult();
		}
		
		
		return null;
		
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
