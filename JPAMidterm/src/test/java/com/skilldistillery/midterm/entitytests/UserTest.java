package com.skilldistillery.midterm.entitytests;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.midterm.entities.User;

class UserTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	User user;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_user_get_data_from_user_table() {
		user = em.find(User.class, 4);
		assertNotNull(user);
		assertEquals(4, user.getId());
		assertEquals("Bella", user.getFirstName());
	}
	
	@Test
	public void test_user_map_address_onetone_assosiation() {
		assertNotNull(user);
		assertEquals("Admin", user.getFirstName());
		assertEquals("Cartersville", user.getAddress().getCity());
		assertEquals("GA", user.getAddress().getStateAbbreviation());
	}
	
	
	@Test
	public void test_user_map_role_onetone_assosiation() {
		assertNotNull(user);
		assertEquals("Admin", user.getFirstName());
		assertEquals("admin", user.getRole().getName());
	}
	
	@Test
	public void test_user_map_event_onetomany_assosiation() {
		assertNotNull(user);
		assertEquals("Admin", user.getFirstName());
		assertEquals(1, user.getEvents().size());
		assertEquals("Metallica at Red Rocks", user.getEvents().get(0).getName());
	}
	
	@Test
	public void test_user_map_eventsubject_onetomany_assosiation() {
		assertNotNull(user);
		assertEquals("Admin", user.getFirstName());
		assertEquals(1, user.getEventSubjects().size());
		assertEquals("Metallica", user.getEventSubjects().get(0).getEventName());
	}
	
	@Test
	public void test_user_map_userevent_onetomany_assosiation() {
		assertNotNull(user);
		assertEquals("Admin", user.getFirstName());
		assertEquals(1, user.getUserEvents().size());
		assertEquals("2019-03-12 16:19:25.0", user.getUserEvents().get(0).getDateCreated().toString());
	}
	
	

}
