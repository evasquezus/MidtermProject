package com.skillsdistillery.midtermproject.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;

public class CommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventSubject eventSubject;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.out.println("In BeforeAll");
		emf = Persistence.createEntityManagerFactory("VideoStore");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		eventSubject = em.find(EventSubject.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventSubject = null;
	}
}
