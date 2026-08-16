package com.naretto.gamestore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naretto.gamestore.model.User;
import com.naretto.gamestore.service.UserService;

/**
 * Resolves every JSP view of the site.
 */
@Controller
public class WelcomeController {

	private final UserService userService;

	@Autowired
	public WelcomeController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/item")
	public String item() {
		return "item";
	}

	@RequestMapping("/login")
	public String inscription(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("/profile")
	public String profile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return inscription(model);
		}
		session.setAttribute("user2", userService.findById(user.getId()));
		return "profile";
	}

	@RequestMapping("/cart")
	public String cart() {
		return "cart";
	}

	@RequestMapping("/store")
	public String store() {
		return "store";
	}

}
