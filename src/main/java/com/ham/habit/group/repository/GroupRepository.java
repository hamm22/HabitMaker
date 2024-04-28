package com.ham.habit.group.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface GroupRepository {
	
	public int insertGroup(@Param("userId") int userId
							, @Param("name") String name
							, @Param("title") String title
							, @Param("description") String description);
}
