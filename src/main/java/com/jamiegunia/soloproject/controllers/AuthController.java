package com.jamiegunia.soloproject.controllers;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jamiegunia.soloproject.models.LoginUser;
import com.jamiegunia.soloproject.models.User;
import com.jamiegunia.soloproject.services.AuthService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AuthController {
	
	@Autowired
	private AuthService auth;
	
	@Autowired HttpSession session;
	
	
	@GetMapping("/dreamhomehq")
	public String index() {
		return "dreamHome.jsp";
	}
	
	@GetMapping("/")
	public String index (Model model) {
		model.addAttribute("loginUser", new LoginUser());
		model.addAttribute("user", new User());
		return "index.jsp";
}

@PostMapping ("/register")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
	
		//check if user already in db add leverage in repository and make the query in service AuthService class
		User possibleUser = auth.get(user.getEmail());
		if (possibleUser != null) {
			result.rejectValue("email", "unique", "User already exists in the database, try a different email. ");
		}
		
		// check that password is the same as confirm password
		if (!user.getPassword().equals(user.getConfirmPassword())) { 
			result.rejectValue("password", "matched", "Password must match confirm password");
		}
	
		if (result.hasErrors()) {
			//need to send in empty log in user before re-rendering the page
			model.addAttribute("loginUser", new LoginUser ());
			return "index.jsp";
		}
		//bcrypt for password
		String hashedPw = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashedPw);
		
		//need to add in autowired service class to call create
		Long userId = auth.create(user).getId();
		
		session.setAttribute("loggedInUserId", userId);
		return "redirect:/home";
}

@PostMapping ("/login")
public String login (@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model) {
	
	//check if email exists in db by using service find by email
	//if the db does NOT find a user with the email, find by email method will return null
	User potentialUser = auth.get(loginUser.getEmail());
	if (potentialUser == null) {
		result.rejectValue("email", "invalid user", "Invalid Login");
	
	//compare that password in db mathces the password from form using bcrypt
	
	} else {
		//! if this returns false
		if (!BCrypt.checkpw(loginUser.getPassword(), potentialUser.getPassword())) {
			result.rejectValue("email", "invalid User", "Invalid Login");
		}
		
	}
	
	//Check if any error are in the form. Validations
	if (result.hasErrors()) {
		model.addAttribute("user", new User());
		return "index.jsp";
	}
	session.setAttribute("loggedInUserId", potentialUser.getId());
	System.out.println (potentialUser.getId());
	return "redirect:/home";
}

//logout
@GetMapping ("/logout")
public String logout() {
	session.invalidate();
	return "redirect:/dreamhomehq";
}

}
