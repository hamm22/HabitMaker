package com.ham.habit.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.group.domain.Group;
import com.ham.habit.group.service.GroupService;
import com.ham.habit.member.domain.Member;
import com.ham.habit.member.dto.MemberDetail;
import com.ham.habit.member.repository.MemberRepository;
import com.ham.habit.user.domain.User;
import com.ham.habit.user.service.UserService;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;
	
	public int addMember(int groupId, int userId, boolean completed) {
		
		if(isMemberByGroupIdAndUserId(groupId, userId)) { // 중복이 되었을때
			return -1;
		} else {
			return memberRepository.insertMember(groupId, userId, completed);	
		}
		
	}
	
//	public int getMemberCount(int groupId) {
//		return memberRepository.countByGroupId(groupId);
//				
//	}
	
	// 그룹 중복 방지
	public boolean isMemberByGroupIdAndUserId(int groupId, int userId) {
		int count = memberRepository.countByGroupIdAndUserId(groupId, userId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// 멤버 리스트 조회
	public List<MemberDetail> getMemberList(int loginUserId){
		List<Member> memberList = memberRepository.selectMemberList();
		
		List<MemberDetail> memberDetailList = new ArrayList<>();
		
		for(Member member:memberList) {
			
		User user = userService.getUser(member.getUserId());
		Group group = groupService.getGroup(member.getGroupId());
		
		MemberDetail memberDetail = new MemberDetail();
		memberDetail.setId(member.getId());
		memberDetail.setGroupId(member.getGroupId());
		memberDetail.setGroupName(group.getName());
		memberDetail.setGroupTitle(group.getTitle());
		memberDetail.setGroupDescription(group.getDescription());
		
		memberDetail.setCompleted(member.getCompleted());
		
		memberDetail.setUserId(member.getUserId());
		memberDetail.setUserLoginId(user.getLoginId());
		memberDetailList.add(memberDetail);
		}
		return memberDetailList;
	}
	

	
}
