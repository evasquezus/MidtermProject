package com.skillsdistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

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
	public void test_user_to_address_association() {
		User cust = em.find(User.class, 4);
		assertNotNull(cust);
		assertEquals(4, cust.getId());
		assertEquals("bella", cust.getFirstName());
	}

}
