package com.man.algoGuru.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.man.algoGuru.models.Question;
import com.man.algoGuru.repos.QuestionRepo;

@Service
public class QuestionService {

private final QuestionRepo questionRepo;
	
	public QuestionService(QuestionRepo questionRepo) {
		this.questionRepo = questionRepo;
	}
	
	public List<Question> allQuestions(){
		return questionRepo.findAll();
	}
	
	public Question updateQuestion(Question project) {
		return questionRepo.save(project);
	}
	
	public Question addQuestion(Question question) {
		return questionRepo.save(question);
	}
	
	public void deleteQuestion(Question question) {
		questionRepo.delete(question);
	}
	
	public Question findById(Long id) {
		Optional<Question> optionalProject = questionRepo.findById(id);
		if(optionalProject.isPresent()) {
			return optionalProject.get();
		}else {
			return null;
		}
	}
}
