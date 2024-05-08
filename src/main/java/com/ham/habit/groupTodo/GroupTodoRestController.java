package com.ham.habit.groupTodo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.groupTodo.service.GroupTodoService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/group/todo")
@RestController
public class GroupTodoRestController {

	@Autowired
	private GroupTodoService groupTodoService;
	
	@PostMapping("/create")
	public Map<String, String> groupTodo(@RequestParam("groupId") int groupId
											, @RequestParam(value="dueDate", required=false)  String dueDate
											,@RequestParam(value ="completed", required=false) boolean completed
											, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = groupTodoService.addGroupTodo(groupId, userId, dueDate, completed);
		
		Map<String, String> resultMap = new HashMap<>();

		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 그룹 완성도 인증
	@PutMapping("/validate")
	public Map<String, String> updateCompleted(@RequestParam("id") int id
												, @RequestParam("groupId") int groupId
												, @RequestParam(value="dueDate", required=false) String dueDate
												, @RequestParam("completed") Boolean completed){
		
		int count = groupTodoService.updateCompleted(id, groupId, dueDate, completed);
		
		Map<String, String> resultMap = new HashMap<>();

		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;		
	}
	
}
