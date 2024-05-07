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
	
	public int countByGroupIdAndUserId(@Param("groupId") int groupId
										, @Param("userId") int userId);
	
	public List<Member> selectMemberList(@Param("userId") int userId);
	
	// 성공 여부
	public int updateCompleted(@Param("id")int id
								, @Param("completed") Boolean completed);
	
	public List<Member> selectMember(@Param("userId") int userId);
	
	// 그룹 탈퇴
	public int deleteMember(@Param("id") int id);
}
