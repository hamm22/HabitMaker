package com.ham.habit.member.dto;

import java.util.List;

import com.ham.habit.group.dto.GroupDetail;

public class MemberDetail {
	private int id;
	private Boolean completed;
	
	private List<GroupDetail> groupList;
	
	private int userId;
	private String userLoginId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Boolean getCompleted() {
		return completed;
	}
	public void setCompleted(Boolean completed) {
		this.completed = completed;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public List<GroupDetail> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<GroupDetail> groupList) {
		this.groupList = groupList;
	}
	
}
