package com.ham.habit.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ham.habit.group.dto.GroupDetail;
import com.ham.habit.member.domain.Member;
import com.ham.habit.member.dto.MemberDetail;
import com.ham.habit.member.service.MemberService;
import com.ham.habit.post.dto.PostDetail;
import com.ham.habit.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/create-view")
	public String inputGroupBoard() {
		return "post/groupBoardList";
	}
	
	@GetMapping("/groupboard-view")
	public String GroupBoard(Model model
							, @RequestParam("groupId") int groupId
							, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postService.getPostList(groupId);
		
		List<GroupDetail> groupList = memberService.getMemberList(userId);
		
		List<MemberDetail> memberList = memberService.getMemberListbyCompleted(groupId);
		
		
		model.addAttribute("postList", postList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("memberList", memberList);
		
		return "post/groupBoardList";
	}
}
