package com.ham.habit.group;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/group")
@Controller
public class GroupController {
	
	@GetMapping("/find-view")
	public String inputGroupFind() {
		return "group/find";
	}
	
	@GetMapping("/join-view")
	public String inputGroupJoin() {
		return "group/join";
	}
	
	@GetMapping("/list-view")
	public String groupList() {
		return "group/list";
	}
}
