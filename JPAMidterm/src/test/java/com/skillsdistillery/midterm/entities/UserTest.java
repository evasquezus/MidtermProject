package com.skillsdistillery.midterm.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skillsdistillery.midterm.entities.User;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.out.println("In BeforeAll");
		emf = Persistence.createEntityManagerFactory("MidtermProject");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		System.out.println("In each");
		em=emf.createEntityManager();
		user = em.find(User.class, 2);
		System.out.println(user +"##########");
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}


	@Test
	void test_user() {
		System.out.println("11111111111");
		assertEquals("Todd", user.getFirstName());
		
	}


}
