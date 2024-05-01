package com.ham.habit.group.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.group.domain.Group;

@Mapper
public interface GroupRepository {
	
	public int insertGroup(@Param("userId") int userId
							, @Param("name") String name
							, @Param("title") String title
							, @Param("description") String description);
	
	public List<Group> selectGroupList();
	
	public Group selectGroup(@Param("id") int id);
	
}
