package com.skilldistillery.midterm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.MidtermMockDAO;
import com.skilldistillery.midterm.entities.User;

@Controller
@ResponseBody
public class MidTermController {

	@Autowired
	private MidtermMockDAO mockDao;

	@RequestMapping(path = { "/", "home.do" }, method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}

	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public ModelAndView registerUser(User user) {
		ModelAndView mv = new ModelAndView();
		mockDao.createUser(user);
		mv.addObject("userID", user);
		mv.setViewName("registerUser.jsp");
		return mv;

	}

	// @RequestMapping(path = "loginUser.do", method = RequestMethod.POST)
	@RequestMapping(value = "/login", produces = MediaType.TEXT_PLAIN_VALUE)
	public String loginUser(HttpSession httpSession, @RequestParam("email") String email, @RequestParam("password") String password) {
		
		loginUser(httpSession, email, password);
		
		return null;
	}

}
