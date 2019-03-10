package com.skilldistillery.midterm.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.midterm.entities.Event;
@Transactional
@Service
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Event createEvent(Event event) {
		em.persist(event);
		em.flush();
		return event;
	}

}
