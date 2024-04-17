package com.ham.habit.todo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/todo")
@Controller
public class TodoController {

	@GetMapping("/main-view")
	public String inputMain() {
		return "todo/main";
	}
	
	@GetMapping("/calendar-view")
	public String Calendar() {
		return "todo/calendar";
	}
	
}
