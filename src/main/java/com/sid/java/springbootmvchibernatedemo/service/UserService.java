package com.sid.java.springbootmvchibernatedemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sid.java.springbootmvchibernatedemo.entity.User;
import com.sid.java.springbootmvchibernatedemo.repository.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public void addUser(final User user) {
		userDao.addUser(user);
	}

	public User getUser(final String name) {
		return userDao.getUser(name);
	}
	
	public void deleteuser(final String name) {
		userDao.deleteUser(name);
	}
	
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}
}