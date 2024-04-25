package com.ham.habit.todo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.todo.domain.Todo;
import com.ham.habit.todo.repository.TodoRepository;

@Service
public class TodoService {
	
	@Autowired
	private TodoRepository todoRepository;
	
	public int addTodo(int userId, String title, String dueDate) {
		return todoRepository.insertTodo(userId, title, dueDate);
	}
	
	public List<Todo> getTodo(int loginUserId, String dueDate){
		List<Todo> todoList = todoRepository.selectTodoList(loginUserId, dueDate);
		return todoList;
	}
	
	public int updateCompleted(int id, Boolean completed){
		return todoRepository.updateCompleted(id, completed);
	}
	
	// 설명
	public int addDescription(int userId, String description){
		return todoRepository.insertDescription(userId, description);
	}
	
	// 설명 수정
	public int updateDescription(int id, String description) {
		return todoRepository.updateDescription(id, description);
	}

}
