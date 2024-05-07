package com.ham.habit.groupTodo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.groupTodo.domain.GroupTodo;
import com.ham.habit.groupTodo.dto.GroupTodoDetail;
import com.ham.habit.groupTodo.repository.GroupTodoRepository;
import com.ham.habit.member.domain.Member;
import com.ham.habit.user.domain.User;
import com.ham.habit.user.service.UserService;

@Service
public class GroupTodoService {
	
	@Autowired
	private GroupTodoRepository groupTodoRepository;
	
	@Autowired
	private UserService userService;
	
	public int addGroupTodo(int groupId, int userId, String dueDate, Boolean completed) {
		
		if(isGroupTodoByGroupIdAndUserId(groupId, userId)) { // 중복이 되었을때
			return -1;
		}
		
		return groupTodoRepository.insertGroupTodo(groupId, userId, dueDate, completed);
				
	}
	
	// 그룹 중복 방지
	public boolean isGroupTodoByGroupIdAndUserId(int groupId, int userId) {
		int count = groupTodoRepository.countByGroupIdAndUserId(groupId, userId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	// 성공 여부
	public List<GroupTodoDetail> getGroupTodo(int groupId){
		List<GroupTodo> groupTodoList = groupTodoRepository.selectTodoList(groupId);
		
		List<GroupTodoDetail> groupTodoDetailList = new ArrayList<>();
		for(GroupTodo groupTodo:groupTodoList) {
			
			User user = userService.getUser(groupTodo.getUserId());
			
			GroupTodoDetail groupTodoDetail = new GroupTodoDetail();
			groupTodoDetail.setId(groupTodo.getId());
			groupTodoDetail.setGroupId(groupTodo.getGroupId());
			groupTodoDetail.setDueDate(groupTodo.getDueDate());
			groupTodoDetail.setCompleted(groupTodo.getCompleted());
			groupTodoDetail.setUserId(groupTodo.getUserId());
			groupTodoDetail.setUserLoginId(user.getLoginId());
			groupTodoDetailList.add(groupTodoDetail);
		}
		
		return groupTodoDetailList;
	}
	
	public int updateCompleted(int id, int groupId, String dueDate, Boolean completed) {
		return groupTodoRepository.updateCompleted(id, groupId, dueDate, completed);
	}
	
	
}
