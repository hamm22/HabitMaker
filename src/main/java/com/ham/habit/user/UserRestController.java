package com.ham.habit.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.user.service.UserService;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	UserService userService;
	
	// 회원가입 API
	@PostMapping("/join")
	public Map<String, String>Join (@RequestParam("loginId")String loginId
			,@RequestParam("password") String password
			,@RequestParam("name") String name
			,@RequestParam("email") String email) {
		
		int count = userService.addUser(loginId, email, name, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 로그인 API
	
	
}
