package com.ham.habit.todo;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.todo.service.TodoService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/todo")
@RestController
public class TodoRestController {
	
	@Autowired
	private TodoService todoService;
	
	@PostMapping("/create")
	public Map<String, String> inputTodo( @RequestParam("title") String title
			 							  , @RequestParam("dueDate") String dueDate
										, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = todoService.addTodo(userId, title, dueDate);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 성공 여부
	@PutMapping("/status")
	public Map<String, String> updateCompleted(@RequestParam("id") int id
												, @RequestParam("completed") Boolean completed){

		int count = todoService.updateCompleted(id, completed);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;		
	}

	// 설명 생성
	@PutMapping("/description")
	public Map<String, String> inputDescription(@RequestParam("description") String description
													, HttpSession session){

		int userId = (Integer)session.getAttribute("userId");
		
		int count = todoService.addDescription(userId, description);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;		
	}
	
	 // 할일 삭제
	@DeleteMapping("/delete")
	public Map<String, String> deleteWork(@RequestParam("id") int id
											, HttpSession session){
	
	int userId = (Integer)session.getAttribute("userId");
	
	int count = todoService.deleteTodo(userId, id);
	
	Map<String, String> resultMap = new HashMap<>();

	if (count == 1) {
		resultMap.put("result", "success");
	} else {
		resultMap.put("result", "fail");
	}
	
	return resultMap;
	}
	
}
