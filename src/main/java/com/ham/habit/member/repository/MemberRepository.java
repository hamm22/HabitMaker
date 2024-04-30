package com.ham.habit.member.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberRepository {

	public int insertMember(@Param("groupId") int groupId
							, @Param("userId") int userId
							, @Param("completed") boolean completed);
	
}
