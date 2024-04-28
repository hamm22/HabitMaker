package com.ham.habit.group.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.group.repository.GroupRepository;

@Service
public class GroupService {

	@Autowired
	private GroupRepository groupRepository;
	
	public int addGroup(int userId, String name, String title, String description) {
		return groupRepository.insertGroup(userId, name, title, description);
	}
}
