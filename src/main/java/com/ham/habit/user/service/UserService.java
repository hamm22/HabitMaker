package com.ham.habit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.common.EncryptUtils;
import com.ham.habit.user.domain.User;
import com.ham.habit.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	public UserRepository userRepository;
	
	public int addUser(String loginId, String email, String name, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userRepository.insertUser(loginId, email, name, encryptPassword);
	}
	
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userRepository.selectUserByLoginIdAndPassword(loginId, encryptPassword);

	    }
	
	// 중복
	public boolean isDuplicateId(String loginId) {
		int count = userRepository.selectCountId(loginId);
		return count != 0;
	}
	
	
}
