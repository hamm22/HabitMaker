package com.ham.habit.todo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.todo.service.TodoService;

@RequestMapping("todo")
@RestController
public class TodoRestController {
	
	@Autowired
	private TodoService todoService;
	
	@PostMapping("/create")
	public Map<String, String> calendar() {
		
		return resu
	}
	

}
