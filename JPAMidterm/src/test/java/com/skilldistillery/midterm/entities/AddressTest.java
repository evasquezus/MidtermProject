package com.skilldistillery.midterm.entities;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.midterm.entities.Address;

public class AddressTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	Address address;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MidtermProject");
		em = emf.createEntityManager();
		address = em.find(Address.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_address_get_data_from_address_table() {
		Address address = em.find(Address.class, 4);
		assertNotNull(address);
		assertEquals(4, address.getId());
		assertEquals("456 Street", address.getAddress());
		assertEquals("2019-03-08 16:19:25.0", address.getDateCreated().toString());
	}
	
	@Test
	public void test_address_user_map_onetone_assosiation() {
		Address address = em.find(Address.class, 4);
		assertNotNull(address);
		assertEquals("Jersey City", address.getCity());
		assertEquals("New Jersey", address.getState());
		assertEquals("456 Street", address.getAddress());
		assertEquals("Bella", address.getUser().getFirstName());
		assertEquals("Jimenez", address.getUser().getLastName());

	}
	
	@Test
	public void test_address_event_map_onetomany_assosiation() {
		Address address = em.find(Address.class, 5);
		assertNotNull(address);
		assertEquals("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address.getEvents().get(0).getDescription());
		
	}
	
	
}
