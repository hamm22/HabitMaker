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
	
	public int addCompleted(int userId, Boolean completed){
		return todoRepository.insertCompleted(userId, completed);
	}
	
}
