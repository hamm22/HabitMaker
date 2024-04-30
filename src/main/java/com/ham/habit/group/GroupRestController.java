package com.ham.habit.group;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.group.service.GroupService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/group")
@RestController
public class GroupRestController {

	@Autowired
	private GroupService groupService;
	
	@PostMapping("/join")
	public Map<String, String> createGroup(
										@RequestParam("name") String name
										, @RequestParam("title") String title
										, @RequestParam(value="description", required=false) String description // null이어도 받아온다
										, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = groupService.addGroup(userId, name, title, description);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
	return resultMap;
	}

		
}
