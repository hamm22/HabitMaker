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
	
	public int addTodo(int userId, String title, String dueDate) {
		return todoRepository.insertTodo(userId, title, dueDate);
	}
	
	public List<Todo> getTodo(int loginUserId, String dueDate){
		List<Todo> todoList = todoRepository.selectTodoList(loginUserId, dueDate);
		return todoList;
	}
	
	public Todo getTodo(int id) {
		return todoRepository.selectTodo(id);
	}
	
	// 할일 삭제
	public int deleteTodo(int userId, int id) {
		Todo todo = todoRepository.selectTodo(id);
		
		if(userId != todo.getUserId()) {
			return -1;
		}
		
		return todoRepository.deleteTodo(id);
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
