package com.ham.habit.member.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import jakarta.transaction.Transactional;

@Mapper
public interface MemberRepository {

	public int insertMember(@Param("groupId") int groupId
							, @Param("userId") int userId
							, @Param("completed") boolean completed);
	//  조회
	public int countByGroupId(@Param("groupId") int groupId);
	
	public int countByGroupIdAndUserId(@Param("groupId") int groupId
										, @Param("userId") int userId);
	
	
}
