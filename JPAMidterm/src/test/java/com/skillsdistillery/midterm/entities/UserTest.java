package com.skillsdistillery.midterm.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	@PersistenceContext
	private EntityManager em;
	
	private User user;
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.out.println("In BeforeAll");
		
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		
	}

	@BeforeEach
	void setUp() throws Exception {
		System.out.println("In each");
//		em=emf.createEntityManager();
		
		System.out.println(user +"##########");
	}

	@AfterEach
	void tearDown() throws Exception {
//		em.close();
//		user = null;
	}


	@Test
	void test_user() {
		user = em.find(User.class, 2);
//		emf = Persistence.createEntityManagerFactory("MidtermProject");
		System.out.println("user");
		assertEquals("Toddksjdfsd", user.getFirstName());
		
	}


}
