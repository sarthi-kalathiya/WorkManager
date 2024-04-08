package com.sid.java.springbootmvchibernatedemo.utilities;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import com.sid.java.springbootmvchibernatedemo.entity.Todo;

public class Operation {
	public static List<Long> getDueTime(List<Todo> todos) {
		List<Long> differences = new ArrayList<>();
		LocalDate currentDate = LocalDate.now();
		for (Todo todo : todos) {
			long difference = ChronoUnit.DAYS.between(currentDate, todo.getDate()); // calculate the difference in days
			differences.add(difference); // add the difference to the list
		}
		return differences;
	}

	public static Todo getNearest(List<Todo> todos) {
		long mindif = 100000000;
		Todo urgent = null;
		LocalDate currentDate = LocalDate.now();
		for (Todo todo : todos) {
			long difference = ChronoUnit.DAYS.between(currentDate, todo.getDate());
			if (mindif > difference && difference >= 0 && difference <= 2) {
				urgent = todo;
				mindif = difference;
			}
		}
		return urgent;
	}
}