package com.ham.habit.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.member.service.MemberService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/group")
@RestController
public class MemberRestController {
	
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/sign-up")
	public Map<String, String> joinGroup(@RequestParam("groupId") int groupId
											,@RequestParam(value = "completed", required = false) boolean completed
											, HttpSession session) {

		int userId = (Integer) session.getAttribute("userId");

		int count = memberService.addMember(groupId, userId, completed);

		Map<String, String> resultMap = new HashMap<>();

		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
		
	}
