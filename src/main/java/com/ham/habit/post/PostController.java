package com.ham.habit.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {

	@GetMapping("/main-view")
	public String inputMain() {
		return "post/main";
	}
	
	@GetMapping("/calendar-view")
	public String Calendar() {
		return "post/calendar";
	}
	
}
