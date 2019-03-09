package com.skilldistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CommentTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	Comment comment;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		comment = em.find(Comment.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_comment_map_user_event_many_to_one() {
		assertNotNull(comment);
		assertEquals("2004-05-23 14:25:10.0", comment.getUserEvent().getDateCreated().toString());
	}
	

}
