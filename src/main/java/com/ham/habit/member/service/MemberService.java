package com.ham.habit.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.member.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	public int addMember(int groupId, int userId, boolean completed) {
		return memberRepository.insertMember(groupId, userId, completed);
	}
	
	
}
