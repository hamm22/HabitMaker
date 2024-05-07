package com.ham.habit.groupTodo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.groupTodo.domain.GroupTodo;

@Mapper
public interface GroupTodoRepository {
	
	public int insertGroupTodo(@Param("groupId") int groupId
								, @Param("userId") int userId
								, @Param("dueDate") String dueDate
								, @Param("completed") boolean completed);
	
	public int countByGroupIdAndUserId(@Param("groupId") int groupId
										, @Param("userId") int userId);
	
	public List<GroupTodo> selectTodoList(@Param("groupId")int groupId);

	// 성공 여부
	public int updateCompleted(@Param("id")int id
								, @Param("groupId") int groupId
								, @Param("dueDate") String dueDate
								, @Param("completed") Boolean completed);

}
