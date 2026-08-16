package com.naretto.gamestore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.naretto.gamestore.model.User;
import com.naretto.gamestore.service.UserService;

@Controller
public class UserController {

	private final UserService userService;
	private final WelcomeController welcomeController;

	@Autowired
	public UserController(UserService userService, WelcomeController welcomeController) {
		this.userService = userService;
		this.welcomeController = welcomeController;
	}

	@GetMapping("disconnect")
	public String disconnect(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return welcomeController.inscription(model);
	}

	@PostMapping("/changePass")
	public String changePass(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String newPass2 = request.getParameter("newPass2");
		userService.changePassword(user, oldPass, newPass, newPass2);
		return welcomeController.profile(model, request);
	}

	@PostMapping("/getUser")
	public String findByIdentifiantAndMotdepasse(HttpServletRequest request, Model model) {
		User user = userService.authenticate(request.getParameter("email"), request.getParameter("mdp"));
		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(5 * 60);
			session.setAttribute("user", user);
			return welcomeController.index();
		}
		return welcomeController.inscription(model);
	}

	@PostMapping(path = "/insertUser")
	public String createUser(@Validated @ModelAttribute("user") User user, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		user = userService.register(user);
		session.setAttribute("user", user);
		return welcomeController.index();
	}

}
