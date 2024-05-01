package com.ham.habit.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.member.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	public int addMember(int groupId, int userId, boolean completed) {
		
		if(isMemberByGroupIdAndUserId(groupId, userId)) {
			return -1;
		} else {
			return memberRepository.insertMember(groupId, userId, completed);	
		}
		
		
	}
	
	public int getMemberCount(int groupId) {
		return memberRepository.countByGroupId(groupId);
				
	}
	
	public boolean isMemberByGroupIdAndUserId(int groupId, int userId) {
		int count = memberRepository.countByGroupIdAndUserId(groupId, userId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
}
