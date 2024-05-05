package com.ham.habit.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.habit.post.domain.Post;

@Mapper
public interface PostRepository {
	
//	public List<Post> selectPostList(@Param("userId") int userId);
	
	public int insertPost(@Param("groupId") int groupId
							, @Param("userId") int userId
							,@Param("contents") String contents
							, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList (@Param("groupId") int groupId
										, @Param("userId") int userId);
}
