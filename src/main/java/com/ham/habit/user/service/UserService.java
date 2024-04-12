package com.ham.habit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	public UserRepository userRepository;
	
	public int addUser(String loginId, String email, String name, String password) {
		return userRepository.insertUser(loginId, email, name, password);
	}
}
