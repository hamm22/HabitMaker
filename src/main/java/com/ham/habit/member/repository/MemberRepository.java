package com.ham.habit.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.member.domain.Member;

@Mapper
public interface MemberRepository {

	public int insertMember(@Param("groupId") int groupId
							, @Param("userId") int userId
							, @Param("completed") boolean completed);
	//  조회
//	public int countByGroupId(@Param("groupId") int groupId);
	
	public int countByGroupIdAndUserId(@Param("groupId") int groupId
										, @Param("userId") int userId);
	
	public List<Member> selectMemberList(@Param("userId") int userId);
	
}
