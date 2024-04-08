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
public class TodoDao {

	// define field for entity manager
	private EntityManager entityManager;

	// set up constructor injection
	@Autowired
	public TodoDao(EntityManager theEntityManager) {
		this.entityManager = theEntityManager;
	}

	public Todo getTodo(final int id) {
		Todo todo = null;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			todo = currentSession.get(Todo.class, id);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
		return todo;
	}

	public List<Todo> getTodos(final String name) {
		List<Todo> todos = null;
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			User user = currentSession.get(User.class, name);
			// create a query
			TypedQuery<Todo> theQuery = currentSession.createQuery("from Todo where user=:ur", Todo.class);
			theQuery.setParameter("ur", user);
			todos = theQuery.getResultList();
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
		return todos;
	}

	@Transactional
	public void addTodo(Todo t, String name) {
		Session currentSession = entityManager.unwrap(Session.class);
		User user = currentSession.get(User.class, name);
		if (user != null) {
			t.setUser(user);
			List<Todo> todos = user.getTodos();
			todos.add(t);
			currentSession.persist(user);
		}
		currentSession.close();
	}

	@Transactional
	public void updateTodo(Todo t) {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			TypedQuery<Todo> theQuery = currentSession.createQuery("from Todo where id=:tid", Todo.class);
			theQuery.setParameter("tid", t.getId());
			Todo t1 = theQuery.getSingleResult();
			t1.setDescription(t.getDescription());
			t1.setTitle(t.getTitle());
			t1.setDate(t.getDate());
			currentSession.merge(t1);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
	}

	@Transactional
	public void deleteTodo(int id) {
		try {
			Session currentSession = entityManager.unwrap(Session.class);
			Todo todo = currentSession.get(Todo.class, id);
			currentSession.remove(todo);
			currentSession.close();
		} catch (Exception e) {
			// Handle the exception appropriately, for example, log the error message or
			System.err.println("An exception occurred: " + e.getMessage());
		}
	}
}