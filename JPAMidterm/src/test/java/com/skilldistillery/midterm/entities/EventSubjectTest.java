package com.skilldistillery.midterm.entities;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.midterm.entities.EventSubject;

class EventSubjectTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	EventSubject eventsubj;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		eventsubj = em.find(EventSubject.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_eventsubject_get_data() {
		eventsubj = em.find(EventSubject.class, 3);
		assertNotNull(eventsubj);
		assertEquals(3, eventsubj.getId());
		assertEquals("chainsmokers", eventsubj.getEventName());
		assertFalse(eventsubj.getFlagContent());
	}
	
	@Test
	public void test_eventsubject_return_null_if_doesnot_exist() {
		eventsubj = em.find(EventSubject.class, 4);
		assertNull(eventsubj);
	}
	
	@Test
	public void test_eventsubject_map_user_manytoone_assosiation() {
		assertNotNull(eventsubj);
		assertEquals("todd", eventsubj.getUser().getFirstName());
		assertEquals("a", eventsubj.getUser().getAddress().getApartment());
	}
	
	@Test
	public void test_eventsubject_event_map_onetomany_assosiation() {
		assertNotNull(eventsubj);
		assertEquals(1, eventsubj.getEvents().size());
		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", eventsubj.getEvents().get(0).getDescription());
	}
	
}





