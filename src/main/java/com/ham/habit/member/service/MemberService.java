package com.ham.habit.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.group.domain.Group;
import com.ham.habit.group.dto.GroupDetail;
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
	
	// 그룹 가입
	public int addMember(int groupId, int userId, boolean completed) {
		
		if(isMemberByGroupIdAndUserId(groupId, userId)) { // 중복이 되었을때
			return -1;
		} else {
			return memberRepository.insertMember(groupId, userId, completed);	
		}
		
	}
	
	// 그룹 중복 방지
	public boolean isMemberByGroupIdAndUserId(int groupId, int userId) {
		int count = memberRepository.countByGroupIdAndUserId(groupId, userId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// 해당 그룹에 가입된 멤버 리스트 조회
	public List<GroupDetail> getMemberList(int loginUserId){
		List<Member> memberList = memberRepository.selectMemberList(loginUserId);
		
		List<GroupDetail> groupDetailList = new ArrayList<>();
		
		for(Member member:memberList) {
			
			Group group = groupService.getGroup(member.getGroupId());
			User user = userService.getUser(group.getUserId());
			GroupDetail groupDetail = new GroupDetail();
			
			groupDetail.setId(group.getId());
			groupDetail.setName(group.getName());
			groupDetail.setTitle(group.getTitle());
			groupDetail.setDescription(group.getDescription());
			groupDetail.setUserId(group.getUserId());
			groupDetail.setUserLoginId(user.getLoginId());
			
			groupDetailList.add(groupDetail);
		
		}
		return groupDetailList;
	}
	
	// 성공 여부
	public List<MemberDetail> getMemberListbyCompleted(int groupId){
		
		List<Member> memberList = memberRepository.selectMember(groupId);
		
		List<MemberDetail> memberDetailList = new ArrayList<>();
		
		for(Member member:memberList) {
			
			User user = userService.getUser(member.getUserId());
			
			MemberDetail memberDetail = new MemberDetail();
			memberDetail.setId(member.getId());
			memberDetail.setGroupId(member.getGroupId());
			memberDetail.setUserId(member.getUserId());
			memberDetail.setCompleted(member.getCompleted());
			memberDetail.setUserLoginId(user.getLoginId());
			memberDetailList.add(memberDetail);
		}
		return memberDetailList;
	
	}
	
	public int updateCompleted(int id, int groupId, Boolean completed) {
		return memberRepository.updateCompleted(id, groupId, completed);
	}
	
	// 그룹 탈퇴
	public int deleteMember(int userId, int id) {
		return memberRepository.deleteMember(id);
	}
	
}
