package com.man.algoGuru.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.man.algoGuru.models.Category;
import com.man.algoGuru.repos.CategoryRepo;


@Service
public class CategoryService {

	@Autowired
	private CategoryRepo categoryRepo;
	
//	READ ALL
	public List<Category> allCategories() {
		return categoryRepo.findAll();
	}

//	CREATE
	public Category createCategory(Category l) {
		return categoryRepo.save(l);
	}

//	READ ONE
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if (optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	
	// Update
	public Category updateCategory(Category l) {
		Category updateCategory = categoryRepo.save(l);
		return updateCategory;
	}
	
	// Delete
	public void deleteCategory(Long id) {
		categoryRepo.deleteById(id);
	}
}
