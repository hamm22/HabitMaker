package com.ham.habit.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ham.habit.todo.domain.Todo;
import com.ham.habit.todo.service.TodoService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/todo")
@Controller
public class TodoController {

	@Autowired
	private TodoService todoService;
	
	@GetMapping("/main-view")
	public String inputMain(Model model
							, @RequestParam("dueDate") String dueDate
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
	
		List<Todo> todoList = todoService.getTodo(userId, dueDate);
		model.addAttribute("todoList", todoList);
		
		return "todo/main";
	}
	
	@GetMapping("/calendar-view")
	public String Calendar(Model model
							, @RequestParam("dueDate") String dueDate
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Todo> todoList = todoService.getTodo(userId, dueDate);
		
		model.addAttribute("todoList", todoList);
				
		return "todo/calendar";
	}
	
}
