package com.ham.habit.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.todo.repository.TodoRepository;

@Service
public class TodoService {
	
	@Autowired
	private TodoRepository todoRepository;
	
	public int addTodo(int userId, String title, Boolean completed, String description, int goal) {
		return todoRepository.insertTodo(userId, title, completed, description, goal);
	}
	
}
