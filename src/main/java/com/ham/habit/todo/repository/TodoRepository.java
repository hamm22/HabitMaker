package com.ham.habit.todo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.todo.domain.Todo;

@Mapper
public interface TodoRepository {
	
	public int insertTodo(@Param("userId")int userId
							, @Param("title") String title);
	
	public List<Todo> selectTodoList();
	
	public int insertCompleted(@Param("userId")int userId
								, @Param("completed") Boolean completed);
}
