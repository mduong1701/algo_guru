package com.man.algoGuru.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.man.algoGuru.models.Comment;
import com.man.algoGuru.repos.CommentRepo;

@Service
public class CommentService {
	private final CommentRepo commentRepo;
	
	public CommentService(CommentRepo commentRepo) {
		this.commentRepo = commentRepo;
	}
	
	public List<Comment> allComments(){
		return commentRepo.findAll();
	}
	
	public Comment addComment(Comment comment) {
		return commentRepo.save(comment);
	}
	
	public void deleteComment(Comment comment) {
		commentRepo.delete(comment);
	}
	
	public List<Comment> questionComments(Long questionId){
		return commentRepo.findByQuestionIdIs(questionId);
	}
}