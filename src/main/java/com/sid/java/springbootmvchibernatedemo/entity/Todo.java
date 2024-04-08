package com.sid.java.springbootmvchibernatedemo.entity;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "todo")
public class Todo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "title")
	private String title;

	@Column(name = "description")
	private String description;

	@Temporal(TemporalType.DATE)
	@Column(name = "cdate")
	private LocalDate date;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "User_name")
	private User user;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Todo(String name, String description, LocalDate date2) {
		super();
		this.title = name;
		this.description = description;
		this.date = date2;
	}

	@Override
	public String toString() {
		return "Todo [id=" + id + ", name=" + title + ", description=" + description + ", date=" + date + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

}