package com.ham.habit.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.habit.user.domain.User;
import com.ham.habit.user.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	
	// 중복
	@GetMapping("/duplicate-id")
	public  Map<String, Boolean> isDupcliateId(@RequestParam("loginId")String loginId) {

		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("isDuplicate", userService.isDuplicateId(loginId));
		return resultMap;
	}

	// 로그인 API
	@PostMapping("/login")
	public Map<String, String> Login(@RequestParam("loginId")String loginId
			,@RequestParam("password") String password
			, HttpServletRequest request){
		
		User user = userService.getUserByLoginIdAndPassword(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
			
			// 조회된 사용자 정보 세션에 저장
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
		
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
}
