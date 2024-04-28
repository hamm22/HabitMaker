package com.ham.habit.todo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.todo.domain.Todo;

@Mapper
public interface TodoRepository {
	
	public int insertTodo(@Param("userId")int userId
							, @Param("title") String title
							, @Param("dueDate") String dueDate);
	
	public List<Todo> selectTodoList(@Param("userId")int userId, @Param("dueDate") String dueDate);
	
	
	public Todo selectTodo(@Param("id") int id);
	
	// 할일 삭제
	public int deleteTodo(@Param("id") int id);
	
	
	public int updateCompleted(@Param("id")int id
								, @Param("completed") Boolean completed);
	
	
	public int insertDescription(@Param("userId")int userId
			, @Param("description") String description);
	
	
	public int updateDescription(@Param("id")int id
									, @Param("description") String description);	

}
