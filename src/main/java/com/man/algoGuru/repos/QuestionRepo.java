package com.man.algoGuru.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.man.algoGuru.models.Question;

@Repository
public interface QuestionRepo extends CrudRepository<Question, Long> {

	List<Question> findAll();
	Question findByIdIs(Long id);
}
