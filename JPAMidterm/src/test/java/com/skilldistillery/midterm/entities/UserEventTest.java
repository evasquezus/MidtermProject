package com.skillsdistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserEventTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	UserEvent userEvent;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		userEvent = em.find(UserEvent.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_userevent_get_data() {
		assertNotNull(userEvent);
		assertEquals(1, userEvent.getId());
	}
	
	@Test
	public void test_userevent_map_event_manytone_assosiation() {
		assertNotNull(userEvent);
		assertEquals(1, userEvent.getEvent().getEventSubject().getId());
		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", userEvent.getEvent().getDescription());
		assertEquals("todd@todd.com", userEvent.getUser().getEmail());
	}
	
}
