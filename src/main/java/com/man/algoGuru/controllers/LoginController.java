package com.man.algoGuru.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.man.algoGuru.models.Category;
import com.man.algoGuru.models.Comment;
import com.man.algoGuru.models.LoginUser;
import com.man.algoGuru.models.Question;
import com.man.algoGuru.models.User;
import com.man.algoGuru.services.CategoryService;
import com.man.algoGuru.services.CommentService;
import com.man.algoGuru.services.QuestionService;
import com.man.algoGuru.services.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public String home() {
	    return "home.jsp";
	}
	
	@GetMapping("/login_register")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, 
			Model model, 
			HttpSession session
			) {

	    User user = userService.register(newUser, result);
	     
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, 
			Model model, 
			HttpSession session
			) {
	     
		User user = userService.login(newLogin, result);
	 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	     
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(
			HttpSession session, 
			Model model
			) {
		 
		return "dashboard.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null); 
	    return "redirect:/";
	}
	
	// Create questions
	@GetMapping("/create_question")
	public String create_question(Model model) {
	    model.addAttribute("newQuestion", new Question());
	    List<Category> allCategories = categoryService.allCategories();
		model.addAttribute("allCategories", allCategories);
	    return "create_question.jsp";
	}
	
	@PostMapping("/submit_question")
	public String submit_question(
			@Valid @ModelAttribute("newQuestion") Question newQuestion
			) {

		questionService.addQuestion(newQuestion);
	     
	    return "redirect:/create_question";
	}
	
	// Create categories
		@GetMapping("/create_category")
		public String create_category(Model model) {
		    model.addAttribute("newCategory", new Category());
		    return "create_category.jsp";
		}
		
		@PostMapping("/submit_category")
		public String submit_category(
				@Valid @ModelAttribute("newCategory") Category newCategory
				) {

			categoryService.createCategory(newCategory);
		     
		    return "redirect:/create_category";
		}
	
	@GetMapping("/algorithm")
	public String algorithm(
			HttpSession session, 
			Model model
			) {
	 
		if(session.getAttribute("userId") == null) {
			return "redirect:/login_register";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userService.findById(userId));
		
		model.addAttribute("questions", questionService.allQuestions());
			 
		return "algorithm.jsp";
	}


	@GetMapping("/questions/{id}")
	public String viewQuestion(
			@PathVariable("id") Long id, 
			HttpSession session, 
			Model model
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Question question = questionService.findById(id);
		model.addAttribute("question", question);
		return "view_question.jsp";
	}
	
	@GetMapping("/questions/{id}/answer")
	public String showAnswer(
			@PathVariable("id") Long id, 
			HttpSession session, 
			Model model
			) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Question question = questionService.findById(id);
		model.addAttribute("question", question);
		return "show_answer.jsp";
	}

	@GetMapping("/questions/{id}/comments")
	public String viewComments(
			@PathVariable("id") Long id, 
			HttpSession session, 
			Model model, 
			@ModelAttribute("com") Comment com) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Question question = questionService.findById(id);
		model.addAttribute("question", question);
		model.addAttribute("comments", commentService.questionComments(id));
		return "comments.jsp";
	}
	
	@PostMapping("/questions/{id}/comments")
	public String newQuestionComment(
			@PathVariable("id") Long id, 
			HttpSession session, 
			Model model, 
			@Valid @ModelAttribute("com") Comment com, 
			BindingResult result) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		Question question = questionService.findById(id);
		
		if(result.hasErrors()) {
			model.addAttribute("question", question);
			model.addAttribute("comments", commentService.questionComments(id));
			return "comments.jsp";
		}else {
			Comment newComment = new Comment(com.getComment());
			newComment.setQuestion(question);
			newComment.setWriter(userService.findById(userId));
			commentService.addComment(newComment);
			return "redirect:/questions/" + id + "/comments";
		}
	}
	
	@GetMapping("/profile")
	public String profile() {
	    return "profile.jsp";
	}
}
