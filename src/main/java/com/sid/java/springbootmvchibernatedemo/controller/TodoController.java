package com.sid.java.springbootmvchibernatedemo.controller;

import com.sid.java.springbootmvchibernatedemo.entity.Todo;
import com.sid.java.springbootmvchibernatedemo.entity.User;
import com.sid.java.springbootmvchibernatedemo.service.TodoService;
import com.sid.java.springbootmvchibernatedemo.service.UserService;
import com.sid.java.springbootmvchibernatedemo.utilities.Operation;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TodoController {

	@Autowired
	private UserService userService;

	@Autowired
	private TodoService todoService;



	@GetMapping("signup")
	public String signup() {
		return "sign-up";
	}

	@PostMapping("adduser")
	public String handler(@ModelAttribute User user) {
		User user1 = userService.getUser(user.getName());
		if (user1 == null) {
			userService.addUser(user);
			return "login";
		} else {
			return "exc1";
		}
	}

	@GetMapping("login")
	public String login() {
		return "login";
	}

	@PostMapping("home")
	public String home(@ModelAttribute User user, Model model) {
		User user1 = userService.getUser(user.getName());
		if (user1 == null) {
			return "exc1";
		}
		int b1 = user.getName().compareTo(user1.getName());
		b1 += user.getPassword().compareTo(user1.getPassword());
		if (b1 == 0) {
			model.addAttribute("name", user.getName());
			return "home";
		} else {
			return "exc1";
		}
	}

	@GetMapping("home")
	public String home(@RequestParam(value = "name", required = true) String name, Model model) {
		User user1 = userService.getUser(name);
		if (user1 == null) {
			return "exc1";
		}
		model.addAttribute("name", name);
		return "home";
	}

	@PostMapping("addtodo")
	public String add_todo(@RequestParam(value = "name", required = true) String name, Model model) {
		model.addAttribute("name", name);
		return "addtodo";
	}

	@PostMapping("addintodo")
	public String form3(Model model, @RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "Todoname", required = true) String title,
			@RequestParam(value = "todoDesc", required = true) String description,
			@RequestParam(value = "todoDate", required = true) LocalDate date) {
		Todo t = new Todo(title, description, date);
		todoService.addTodo(t, name);
		model.addAttribute("name", name);
		return "redirect:/home?name=" + name;
	}

	@PostMapping("viewtodo")
	public String view_todo(@RequestParam(value = "name", required = true) String name, Model model) {
		List<Todo> todos = todoService.getTodos(name);
		Todo urgent = Operation.getNearest(todos);
		long mindif = -10;
		if (urgent != null) {
			mindif = ChronoUnit.DAYS.between(LocalDate.now(), urgent.getDate());
		}
		List<Long> differences = Operation.getDueTime(todos);
		model.addAttribute("todos", todos);
		model.addAttribute("differences", differences);
		model.addAttribute("name", name);
		model.addAttribute("urgent", urgent);
		model.addAttribute("diff", mindif);
		return "viewtask";
	}

	@PostMapping("updatetodo")
	public String updatetodo(Model model, @RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "id", required = true) int id) {
		Todo t = todoService.getTodo(id);
		model.addAttribute("name", name);
		model.addAttribute("title", t.getTitle());
		model.addAttribute("desc", t.getDescription());
		model.addAttribute("id", t.getId());
		model.addAttribute("dateoftodo", t.getDate());
		return "updatetodo";
	}

	@PostMapping("form4")
	public String form4(Model model, @ModelAttribute Todo t, @RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "todoDate", required = true) LocalDate date) {
		t.setDate(date);
		todoService.updateTodo(t);
		model.addAttribute("name", name);
		return "redirect:/home?name=" + name;
	}

	@PostMapping("deletetodo")
	public String deletetodo(Model model, @RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "id", required = true) int id) {
		todoService.deleteTodo(id);
		model.addAttribute("name", name);
		return "redirect:/home?name=" + name;
	}

	@PostMapping("logout")
	public String logout(@RequestParam(value = "name", required = true) String name, Model model) {
		return "login";
	}


}