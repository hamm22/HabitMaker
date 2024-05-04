package com.ham.habit.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.habit.common.FileManager;
import com.ham.habit.post.domain.Post;
import com.ham.habit.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
//	public List<Post> getPostList(int userId){
//		return postRepository.selectPostList(userId);
//	}
	
	public int addPost(int groupId, int userId, String contents, MultipartFile imageFile) {
		String imagePath = FileManager.saveFile(userId, imageFile);
		
		return postRepository.insertPost(groupId, userId, contents, imagePath);
	}
	
	public List<Post> getPost(int loginUserId, int groupId){
		List<Post> postList = postRepository.selectPostList(loginUserId, groupId);
		return postList;
	}

}
