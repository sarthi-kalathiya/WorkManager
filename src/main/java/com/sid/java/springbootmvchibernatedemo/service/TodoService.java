package com.sid.java.springbootmvchibernatedemo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sid.java.springbootmvchibernatedemo.entity.Todo;
import com.sid.java.springbootmvchibernatedemo.repository.TodoDao;

@Service
public class TodoService {

	@Autowired
	private TodoDao todoDao;

	public List<Todo> getTodos(final String name) {
		return todoDao.getTodos(name);
	}

//	public List<Teacher> getTeachers() {
//		return teacherDao.getTeachers();
//	}

	public void addTodo(Todo t, String name) {
		todoDao.addTodo(t, name);
	}

	public void updateTodo(Todo t) {
		todoDao.updateTodo(t);
	}

	public void deleteTodo(int id) {
		todoDao.deleteTodo(id);
	}

	public Todo getTodo(final int id) {
		return todoDao.getTodo(id);
	}
//	public void updateTeacher(final Teacher teacher) {
//		teacherDao.updateTeacher(teacher);
//	}

//	public void deleteTeacher(final int id) {
//		teacherDao.deleteTeacher(id);
//	}
}