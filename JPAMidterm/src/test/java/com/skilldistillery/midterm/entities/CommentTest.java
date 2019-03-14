package com.skilldistillery.midterm.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;

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
	
//	@Test
//	public void test_comment_map_user_event_many_to_one() {
//		assertNotNull(comment);
//		assertEquals("2004-05-23 14:25:10.0", comment.getUserEvent().getDateCreated().toString());
//	}
//	
//	@Test
//	public void test_comment_map_replycomments_one_to_many() {
//		assertNotNull(comment);
//		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
//				comment.getReplyComments().get(0).getBody());
//	}
//	
//	@Test
//	public void test_replycomments_comment_map_many_to_one_() {
//		assertNotNull(comment);
//		assertEquals("first comment", 
//				comment.getComment().getTitle());
//		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
//				comment.getComment().getBody());
//	}
	

}
