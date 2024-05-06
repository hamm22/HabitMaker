package com.ham.habit.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.habit.common.FileManager;
import com.ham.habit.group.dto.GroupDetail;
import com.ham.habit.member.service.MemberService;
import com.ham.habit.post.domain.Post;
import com.ham.habit.post.dto.PostDetail;
import com.ham.habit.post.repository.PostRepository;
import com.ham.habit.user.domain.User;
import com.ham.habit.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MemberService memberService;

	public int addPost(int groupId, int userId, String contents, MultipartFile imageFile) {
		
		String imagePath = FileManager.saveFile(userId, imageFile);
		
		return postRepository.insertPost(groupId, userId, contents, imagePath);
	}
	

	public List<PostDetail> getPostList(int groupId){
		List<Post> postList = postRepository.selectPostList(groupId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			User user = userService.getUser(post.getUserId());
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId());
			postDetail.setGroupId(post.getGroupId());
			postDetail.setContents(post.getContents());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setUserLoginId(user.getLoginId());
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
}
