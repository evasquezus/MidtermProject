package com.skillsdistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class RoleTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	Role role;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		role = em.find(Role.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_role_get_null_if_role_doesnot_exist_in_table() {
		role = em.find(Role.class, 3);
		assertNull(role);
	}
	
	@Test
	public void test_role_get_data_from_role_table() {
		role = em.find(Role.class, 2);
		assertNotNull(role);
		assertEquals("admin", role.getName());
	}
	
	@Test
	public void test_role_map_user_onetomany_return_list_of_users_assosiation() {
		role = em.find(Role.class, 2);
		assertNotNull(role);
		assertEquals(3, role.getUsers().size());
		assertEquals("eric", role.getUsers().get(1).getFirstName());
	}
	


}
