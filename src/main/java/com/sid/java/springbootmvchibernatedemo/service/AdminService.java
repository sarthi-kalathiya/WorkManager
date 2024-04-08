package com.sid.java.springbootmvchibernatedemo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sid.java.springbootmvchibernatedemo.entity.Admin;
import com.sid.java.springbootmvchibernatedemo.repository.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public void addAdmin(final Admin admin) {
		adminDao.addAdmin(admin);
	}

	public Admin getAdmin(final String name) {
		return adminDao.getAdmin(name);
	}
}