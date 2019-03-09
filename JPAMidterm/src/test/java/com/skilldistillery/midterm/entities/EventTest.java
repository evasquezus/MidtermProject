package com.skilldistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.midterm.entities.Event;
import com.skilldistillery.midterm.entities.EventSubject;

public class EventTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	Event event;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		event = em.find(Event.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_event_get_data() {
		assertNotNull(event);
		assertEquals(1, event.getId());
		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
				event.getDescription());
	}
	
	@Test
	public void test_event_return_null_if_event_doent_exist() {
		event = em.find(Event.class, 4);
		assertNull(event);
	}
	
	@Test
	public void test_event_map_user_manytone_assosiation() {
		assertNotNull(event);
		assertEquals("2004-05-23 14:25:10.0", event.getFinishTime().toString());
		assertEquals("todd", event.getUser().getFirstName());
		assertEquals("todd@todd.com", event.getUser().getEmail());
	}

	@Test
	public void test_event_map_userevent_onetomany_assosiation() {
		assertNotNull(event);
		assertEquals(1, event.getUserevents().size());
		assertEquals("2004-05-23 14:25:10.0", event.getUserevents().get(0).getDateCreated().toString());
	}
	
	@Test
	public void test_event_map_eventSubject_manytoone_assosiation() {
		assertNotNull(event);
		assertEquals("metallica", event.getEventSubject().getEventName());
	}

}
