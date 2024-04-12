package com.ham.habit.user.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
	
	public int insertUser(@Param("loginId") String loginId
							, @Param("email") String email
							, @Param("name") String name
							, @Param("password") String password);
}
