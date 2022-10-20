package com.man.algoGuru.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.man.algoGuru.models.Comment;

@Repository
public interface CommentRepo extends CrudRepository<Comment, Long> {
	List<Comment> findAll();
	List<Comment> findByQuestionIdIs(Long id);
}