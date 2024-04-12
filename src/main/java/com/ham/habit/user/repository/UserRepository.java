package com.ham.habit.user.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.user.domain.User;

@Mapper
public interface UserRepository {
	
	// 회원가입
	public int insertUser(@Param("loginId") String loginId
							, @Param("email") String email
							, @Param("name") String name
							, @Param("password") String password);
	
	//로그인
	public User selectUserByLoginIdAndPassword(
				@Param("loginId") String loginId
				, @Param("password") String password);

	// 중복
	public int selectCountId(@Param("loginId") String loginId);
}
