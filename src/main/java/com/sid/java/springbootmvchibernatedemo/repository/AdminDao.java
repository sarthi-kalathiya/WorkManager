package com.sid.java.springbootmvchibernatedemo.repository;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sid.java.springbootmvchibernatedemo.entity.Admin;

import jakarta.persistence.EntityManager;

@Repository
public class AdminDao {

	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public AdminDao(EntityManager theEntityManager) {
		this.entityManager = theEntityManager;
	}

	public Admin getAdmin(final String name) {
		// get the current hibernate session
		Admin admin = null;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			admin = currentSession.get(Admin.class, name);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
		return admin;
	}

	@Transactional
	public void addAdmin(Admin admin) {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			currentSession.persist(admin);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
	}
}
