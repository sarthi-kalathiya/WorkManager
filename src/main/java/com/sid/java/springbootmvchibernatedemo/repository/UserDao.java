package com.sid.java.springbootmvchibernatedemo.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sid.java.springbootmvchibernatedemo.entity.Todo;
import com.sid.java.springbootmvchibernatedemo.entity.User;

@Repository
public class UserDao {

	// define field for entity manager
	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public UserDao(EntityManager theEntityManager) {
		this.entityManager = theEntityManager;
	}

	public User getUser(final String name) {
		// get the current hibernate session
		User user = null;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			user = currentSession.get(User.class, name);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
		return user;
	}

	@Transactional
	public void addUser(User user) {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			currentSession.persist(user);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
	}

	public List<User> getAllUser() {
		List<User> users = null;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			// create a query
			TypedQuery<User> theQuery = currentSession.createQuery("from User", User.class);
			users = theQuery.getResultList();

			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
		return users;
	}

	@Transactional
	public void deleteUser(String name) {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			User user = currentSession.get(User.class, name);
			if (user != null) {
				currentSession.remove(user);
			}
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
	}
}