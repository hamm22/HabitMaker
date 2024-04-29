package com.ham.habit.group.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.habit.group.domain.Group;
import com.ham.habit.group.dto.GroupDetail;
import com.ham.habit.group.repository.GroupRepository;
import com.ham.habit.user.domain.User;
import com.ham.habit.user.service.UserService;

@Service
public class GroupService {

	@Autowired
	private GroupRepository groupRepository;
	
	@Autowired
	private UserService userService;
	
	public int addGroup(int userId, String name, String title, String description) {
		return groupRepository.insertGroup(userId, name, title, description);
	}
	
	public List<GroupDetail> getGroupList(int loginUserId){
		List<Group> groupList = groupRepository.selectGroupList();
		
		List<GroupDetail> groupDetailList = new ArrayList<>();
		
		for(Group group:groupList) {
			
			// 사용자 정보
			User user = userService.getUser(group.getUserId());
			
			GroupDetail groupDetail = new GroupDetail();
			groupDetail.setId(group.getId());
			groupDetail.setName(group.getName());
			groupDetail.setTitle(group.getTitle());
			groupDetail.setDescription(group.getDescription());
			groupDetail.setUserId(group.getUserId());
			groupDetail.setUserLoginId(user.getLoginId());
			groupDetailList.add(groupDetail);
			}
		return groupDetailList;
	}
}
