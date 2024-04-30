package com.jamiegunia.soloproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jamiegunia.soloproject.models.House;
import com.jamiegunia.soloproject.models.User;
import com.jamiegunia.soloproject.services.AuthService;
import com.jamiegunia.soloproject.services.HouseService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HouseController {
	
	@Autowired 
	private HouseService houses;
	
	@Autowired AuthService log;
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("/homes/new")
	public String addHomeForm(@ModelAttribute("house") House house, Model model, RedirectAttributes redirect) {
		
		if (session.getAttribute("loggedInUserId") == null) {
			redirect.addFlashAttribute("notLoggedIn", "You Must be logged in to view page!");
			return "redirect:/";
		}
		
		Long userId = (Long) session.getAttribute("loggedInUserId");
		model.addAttribute("userId", userId);
		
		return "addHome.jsp";
	}
	
	
	@PostMapping("/homes/new")
	public String addHome (@Valid @ModelAttribute("house") House house, BindingResult result) {
		
		if (result.hasErrors()) {
			return "addHome.jsp";
		}
		houses.create(house);
		return "redirect:/home";
	}
	
	
	
	@GetMapping ("/home")
	public String home ( Model model, HttpSession session, RedirectAttributes redirect) {
		
		//took out RedirectAttributes redirect and the below for authentication so that when the logged in
		//user shared the link for the dashboard to show another user their dreamhomes, 
		//that user can view without being logged in. However they will not be able to delete or edit
		//since the authentication remains for that route and will need logged in. 
		//But by doing this it will not display the logged in user name to welcome to the dashboard
		
		if (session.getAttribute("loggedInUserId") == null) {

			redirect.addFlashAttribute("notLoggedIn", "You Must be logged in to view page!");
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("loggedInUserId");
		User user = log.get(userId);
//		Long loggedInUserId= (Long) session.getAttribute("loggedInUserId");
//		
//		List <House> userHouses = houses.findById(loggedInUserId);
//		model.addAttribute("userHouses", userHouses);
		
		model.addAttribute("allHouses", houses.all());	
//		 
		String shareLink = "http://localhost:8080/home?user=" + userId;
//		String shareLink = "http://localhost:8080/home";
		 model.addAttribute("shareLink", shareLink);
		
//		model.addAttribute("userName", user.getName());
		return "dashboard.jsp";
	}
	
	
	
	@GetMapping ("/homes/{id}/edit")
	public String editHome (@PathVariable Long id, Model model) {
		
		if (session.getAttribute("loggedInUserId") == null) {
			return "redirect:/";
		}
		model.addAttribute("house", houses.get(id));
		return "editHome.jsp";
	}
	
	@PutMapping ("/homes/{id}/edit")
	public String updateHome (@Valid @ModelAttribute ("house") House house, BindingResult result) {
		if (session.getAttribute("loggedInUserId") == null) {
			return "redirect:/";
		}
		
		if (result.hasErrors()) {
			return "editHome.jsp";
		}
		houses.update(house);
		return "redirect:/home";
	}
	
	@DeleteMapping("/homes/{id}")
	public String deleteHouse (@PathVariable Long id) {
		houses.destroy(id);
		return "redirect:/home";
	}

}
