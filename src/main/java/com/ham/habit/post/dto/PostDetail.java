package com.ham.habit.post.dto;

import java.util.List;

import com.ham.habit.group.dto.GroupDetail;
import com.ham.habit.member.dto.MemberDetail;

public class PostDetail {
	
	private int id;
	private String contents;
	
	private int userId;
	private String userLoginId;
	
	private List<MemberDetail> memberList;
	private List<GroupDetail> groupList;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public List<MemberDetail> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<MemberDetail> memberList) {
		this.memberList = memberList;
	}
	public List<GroupDetail> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<GroupDetail> groupList) {
		this.groupList = groupList;
	}
	
}
