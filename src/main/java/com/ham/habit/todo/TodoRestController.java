package com.ham.habit.todo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.todo.service.TodoService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("todo")
@RestController
public class TodoRestController {
	
	@Autowired
	private TodoService todoService;
	
	@PostMapping("/create")
	public Map<String, String> inputTodo( @RequestParam("title") String title
										, @RequestParam("completed") Boolean completed
										, @RequestParam("description") String description
										, @RequestParam("goal") int goal
										, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = todoService.addTodo(userId, title, completed, description, goal);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	

}
