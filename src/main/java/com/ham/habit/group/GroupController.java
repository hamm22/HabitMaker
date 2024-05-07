package com.ham.habit.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.habit.group.dto.GroupDetail;
import com.ham.habit.group.service.GroupService;
import com.ham.habit.member.service.MemberService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/group")
@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/find-view")
	public String inputGroupFind(Model model
			, HttpSession session) {
		
		List<GroupDetail> groupList = groupService.getGroupList();
		
		model.addAttribute("groupList", groupList);
		
		return "group/find";
	}
	
	@GetMapping("/join-view")
	public String inputGroupJoin() {
		return "group/join";
	}
	
	@GetMapping("/list-view")
	public String groupList(Model model
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<GroupDetail> groupList = memberService.getMemberList(userId);
		
		model.addAttribute("groupList", groupList);
		
		return "group/list";
	}
}
