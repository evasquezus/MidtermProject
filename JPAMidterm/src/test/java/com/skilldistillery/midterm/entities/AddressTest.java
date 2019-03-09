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
		assertEquals("456 street", address.getAddress());
		assertEquals("2004-05-23 14:25:10.0", address.getDateCreated().toString());
	}
	
	@Test
	public void test_address_user_map_onetone_assosiation() {
		Address address = em.find(Address.class, 4);
		assertNotNull(address);
		assertEquals("jersey city", address.getCity());
		assertEquals("new jersey", address.getState());
		assertEquals("456 street", address.getAddress());
		assertEquals("bella", address.getUser().getFirstName());
		assertEquals("jimenez", address.getUser().getLastName());

	}
}
