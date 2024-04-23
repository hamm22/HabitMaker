package com.ham.habit.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.todo.domain.Todo;
import com.ham.habit.todo.repository.TodoRepository;

@Service
public class TodoService {
	
	@Autowired
	private TodoRepository todoRepository;
	
	public int addTodo(int userId, String title) {
		return todoRepository.insertTodo(userId, title);
	}
	
	public List<Todo> getTodo(int loginUserId){
		List<Todo> todoList = todoRepository.selectTodoList();
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
